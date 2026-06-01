# handyman UI

Una aplicación móvil moderna y estilizada desarrollada en **Flutter** diseñada para la gestión, búsqueda y contratación directa de profesionales de servicios para el hogar (plomería, jardinería, mantenimiento, entre otros). 

Este proyecto centraliza la búsqueda de talento local mediante perfiles detallados, optimizando la toma de decisiones basada en costos por hora y reputación (sistema de reseñas), facilitando la navegación e interacción segura en un solo lugar.

### Demo en Video
🎬 [Haz clic aquí para ver el video demostrativo de la aplicación](https://x.com/gugu_async/status/1723936678409126228)

### Inspiración del Diseño
La interfaz de usuario se desarrolló tomando como base el diseño publicado en **Dribbble**. Puedes ver la referencia visual aquí:

![Diseño de Referencia](https://cdn.dribbble.com/userupload/9938309/file/original-7f295169d2e7b7b473f833d72836cdca.jpg?resize=1280x769&vertical=center) 

* **Concepto de Referencia:** [Ver Shot en Dribbble](https://dribbble.com/shots/22512045-Handyman-App-UI-Kit-Template)


> ⚠️ **Nota de Propósito:** Este repositorio es una **Prueba de Concepto (PoC)** enfocada en el desarrollo de la interfaz de usuario (UI/UX), arquitecturas limpias de presentación y manejo de estado dinámico. Siéntete libre de clonarlo, bifurcarlo (*fork*) y utilizar el código como base para tus propios desarrollos.

---

## 🚀 Características Clave (UI)

- **Sistema de Contratación Fluid:** Flujo visual estructurado para la selección de servicios y confirmaciones.
- **Manejo de Estado Global (Riverpod):** Soporte nativo y reactivo para cambio dinámico entre **Tema Claro y Tema Oscuro**.

---

## 🛠️ Requisitos del Sistema y Tecnologías

El proyecto saca provecho de las optimizaciones modernas del lenguaje Dart, específicamente de los **Constructor Tear-offs** (inferencia de tipos en constructores implícitos como funciones de primera clase). Debido a esto, se establecen los siguientes requisitos mínimos de SDK:

- **Dart SDK:** `>= 2.15.0`
- **Flutter SDK:** `>= 2.8.0`

### Dependencias Principales

- **[Flutter Riverpod](https://pub.dev/packages/flutter_riverpod):** Utilizado para la gestión del estado global del tema (`ThemeMode`), garantizando desacoplamiento, testabilidad y renderizado eficiente.

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^17.2.3
  google_fonts: ^8.1.0
  flutter_svg: ^2.3.0
  flutter_riverpod: ^3.3.1
```
