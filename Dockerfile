# syntax=docker/dockerfile:1.6

# Stage 1 — Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app

# Pre-cache dependencies first to leverage Docker layer caching
COPY pubspec.yaml pubspec.lock* ./
RUN flutter pub get

# Bring the rest of the sources
COPY . .

# Make sure the web platform exists (idempotent) and build for release
RUN flutter create --platforms=web --project-name=sossa_page . \
    && flutter pub get \
    && flutter build web --release

# Stage 2 — Serve static build with nginx
FROM nginx:1.27-alpine AS runtime

# SPA-aware nginx config (fallback to index.html for client routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the compiled web app
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O - http://127.0.0.1/ >/dev/null || exit 1

CMD ["nginx", "-g", "daemon off;"]
