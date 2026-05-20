# SOSSA_PAGE

Pagina con login, registro y home.

Aplicación Flutter con navegación entre pantallas, registro de usuario, inicio de sesión y pantalla principal.

## Características

- **Login**: usuario/correo + contraseña.
- **Registro**: nombre, correo, contraseña y verificación de contraseña (con validación de coincidencia).
- **Home**: pantalla principal con el branding `sossa_page` y botón de cerrar sesión.
- Persistencia local con `SharedPreferences`.

## Estructura

```
lib/
├── main.dart
├── models/
│   └── user.dart
├── services/
│   └── auth_service.dart
└── screens/
    ├── login_screen.dart
    ├── register_screen.dart
    └── home_screen.dart
```

## Cómo correr

Necesitas Flutter SDK instalado (`flutter --version`).

```bash
flutter pub get
flutter run
```

Para crear las carpetas de plataforma (android, ios, web, windows) si no existen:

```bash
flutter create .
```

## Flujo

1. Si no hay sesión activa, la app abre en **Login**.
2. Desde Login se puede ir a **Registro** para crear una cuenta.
3. Tras un registro exitoso o un login válido, se navega a **Home**.
4. El botón **Cerrar sesión** en Home regresa al Login.

## Docker

La app se empaqueta con un build multi-stage (Flutter SDK → nginx alpine sirviendo los estáticos).

```bash
# build + run
docker compose up --build

# o sin compose
docker build -t sossa_page:local .
docker run --rm -p 8080:80 --name sossa_page sossa_page:local
```

Abrir http://localhost:8080. El primer build descarga la imagen base de Flutter (~2 GB) y compila la app — los siguientes son mucho más rápidos gracias al cache.
