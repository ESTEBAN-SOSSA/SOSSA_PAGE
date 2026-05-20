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
