<div align="center">

# 📋 Tascom

**A modern task management and community platform built with Flutter**

[![Flutter](https://img.shields.io/badge/Flutter-3.38.5-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.4+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![CI](https://github.com/ahmedjalambo-dev/tascom/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/ahmedjalambo-dev/tascom/actions)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

Streamline your workflow. Create tasks, collaborate with your community, and get things done — all from your pocket.

<!-- Add your project banner or demo GIF here -->
<!-- ![Tascom Demo](assets/images/demo.gif) -->

[Getting Started](#-getting-started) · [Features](#-features) · [Report Bug](https://github.com/ahmedjalambo-dev/tascom/issues) · [Request Feature](https://github.com/ahmedjalambo-dev/tascom/issues)

</div>

---

## 📑 Table of Contents

- [About the Project](#-about-the-project)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture--folder-structure)
- [Getting Started](#-getting-started)
- [Usage](#-usage)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact & Acknowledgments](#-contact--acknowledgments)

---

## 💡 About the Project

**Tascom** is a mobile-first task management and community platform designed as a graduation capstone project. It connects people who need tasks done with those willing to help — whether it's a cleaning job, a quick errand, or a technical favor.

### The Problem

Traditional task boards are web-heavy, clunky on mobile, and lack the community-driven features needed for local collaboration.

### The Solution

Tascom provides a clean, native mobile experience where users can:

- **Post tasks** with priorities, categories, and descriptions
- **Claim tasks** from a community feed
- **Track progress** with status management and filtering
- **Stay secure** with JWT-based authentication and encrypted storage

Built with a scalable feature-driven architecture, Tascom is designed to grow with its community.

---

## ✨ Features

### 🔐 Authentication
- Email & password login and registration
- Google OAuth 2.0 sign-in
- Forgot password & reset password flow
- Secure token storage (Android Keystore / iOS Keychain)

<!-- ![Auth Screens](docs/screenshots/auth.png) -->

### 📝 Task Management
- Create tasks with title, description, priority, and category
- Browse and search the task feed
- Claim tasks from other community members
- Filter tasks by priority and sort by date

<!-- ![Task Management](docs/screenshots/tasks.png) -->

### 👤 User Profiles
- View and edit profile information
- Upload profile photos
- Location-based services with reverse geocoding
- Account management (edit profile, delete account)

<!-- ![Profile](docs/screenshots/profile.png) -->

### 📊 Dashboard & Settings
- Points history and rewards tracking
- Reports and statistics overview
- Task requests management
- App settings and preferences

### 🎯 Onboarding
- Guided onboarding flow for new users
- Clean, visual walkthrough of app features

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter 3.38.5 |
| **Language** | Dart ^3.10.4 |
| **State Management** | flutter_bloc (Cubit) |
| **Dependency Injection** | get_it (Service Locator) |
| **Networking** | Dio + Retrofit (code-generated REST client) |
| **Backend** | Custom REST API hosted on Railway |
| **Data Classes** | Freezed + json_serializable |
| **Secure Storage** | flutter_secure_storage (Keystore/Keychain) |
| **Local Storage** | shared_preferences |
| **Responsive UI** | flutter_screenutil (375×812 base) |
| **Icons** | SVG-based (flutter_svg) |
| **Images** | cached_network_image |
| **Location** | geolocator + geocoding |
| **Font** | Poppins (weights 100–900) |
| **CI/CD** | GitHub Actions |

---

## 🏗 Architecture / Folder Structure

Tascom follows a **feature-driven vertical slice architecture** with a clear separation between shared infrastructure (`core/`) and feature modules (`features/`).

**Data Flow:** `UI → Cubit → Repository → Retrofit Service → Dio → API`

```
lib/
├── main.dart                          # App entry point & initialization
├── my_app.dart                        # Root MaterialApp widget
│
├── core/                              # 🔧 Shared infrastructure
│   ├── constants/                     # Icon & image asset paths
│   ├── di/                            # GetIt dependency injection setup
│   ├── extentions/                    # Navigation & utility extensions
│   ├── helpers/                       # Validators, time utilities
│   ├── networking/                    # Dio factory, API constants, error handling
│   │   ├── api_constants.dart         #   Base URL & endpoint definitions
│   │   ├── api_error_handler.dart     #   DioException → ApiErrorModel
│   │   ├── api_result.dart            #   ApiResult<T> sealed class
│   │   └── dio_factory.dart           #   Dio config & auth interceptor
│   ├── routes/                        # Route constants & generation
│   ├── services/                      # Location service
│   ├── storage/                       # Session manager, SharedPrefs, SecureStorage
│   ├── themes/                        # Colors, text styles, theme data
│   └── widgets/                       # Reusable My-prefixed components
│       ├── my_button.dart
│       ├── my_text_field.dart
│       ├── my_app_bar.dart
│       ├── my_drop_down.dart
│       ├── bottom_sheets/
│       └── dialogs/
│
└── features/                          # 📦 Feature modules
    ├── auth/                          # Authentication
    │   ├── login/                     #   Email/password login
    │   ├── register/                  #   User registration
    │   ├── google_login/              #   Google OAuth
    │   ├── logout/                    #   Session termination
    │   ├── forgot_password/           #   Password reset request
    │   └── reset_password/            #   Password reset completion
    ├── create_task/                   # Task creation
    ├── get_tasks/                     # Task fetching, filtering, sorting
    ├── claim_task/                    # Task claiming
    ├── home/                          # Home feed screen
    ├── search/                        # Task search
    ├── profile/                       # User profile
    ├── onboarding/                    # Onboarding flow
    ├── settings/                      # Settings & account management
    │   ├── edit_profile/
    │   ├── delete_account/
    │   ├── points_history/
    │   ├── reports/
    │   └── requests/
    └── user/                          # User data management
```

Each feature module follows this internal structure:

```
feature_name/
├── cubit/          # feature_cubit.dart + feature_state.dart (Freezed)
├── data/
│   ├── models/     # Request/Response DTOs (Freezed + json_serializable)
│   ├── repos/      # Repository wrapping service, returns ApiResult<T>
│   └── services/   # Retrofit service interface (@RestApi)
└── ui/             # Screens and feature-specific widgets
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** `3.38.5` — install via [FVM](https://fvm.app/) (recommended) or [flutter.dev](https://docs.flutter.dev/get-started/install)
- **Dart SDK** `^3.10.4` (bundled with Flutter)
- **Android Studio** or **VS Code** with Flutter extension
- **Git**

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/ahmedjalambo-dev/tascom.git
   cd tascom
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run code generation** (Retrofit, Freezed, json_serializable)

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

### Environment Configuration

The API base URL is configured in `lib/core/networking/api_constants.dart`. If you're running your own backend instance, update the base URL there:

```dart
static const String baseUrl = 'https://your-backend-url.com/';
```

---

## 📱 Usage

Once the app is running:

1. **Onboarding** — Swipe through the welcome screens to learn about Tascom's features
2. **Sign Up / Log In** — Create an account with email or sign in with Google
3. **Home Feed** — Browse available tasks posted by the community
4. **Create a Task** — Tap the create button to post a new task with priority and category
5. **Claim a Task** — Find a task you can help with and claim it
6. **Filter & Sort** — Use priority filters and sorting options to find relevant tasks
7. **Profile** — Manage your profile, view points history, and track your activity

---

## 🗺 Roadmap

- [x] User authentication (Email, Google OAuth, password reset)
- [x] Task creation and management
- [x] Task claiming system
- [x] Priority filtering and sorting
- [x] User profiles with photo upload
- [x] Location-based services
- [x] Onboarding flow
- [x] Settings and account management
- [ ] 💬 **Real-time chat** — In-app messaging between task owners and claimers
- [ ] 🗺️ **Map view** — Location-based task discovery on an interactive map
- [ ] 🤖 **AI features** — Smart task suggestions and auto-categorization
- [ ] 🔍 **Search migration** — Migrate search to Cubit with API integration
- [ ] 🏠 **Home migration** — Migrate home feed from mock data to full API integration
- [ ] 📌 **Save/bookmark tasks** — Save tasks for later viewing
- [ ] 🌙 **Dark mode** — Dark theme support
- [ ] 🔔 **Push notifications** — Real-time task updates and reminders

---

## 🤝 Contributing

Contributions make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'feat: add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Guidelines

- Follow the existing code style and naming conventions (`snake_case` files, `My`-prefixed shared widgets)
- Run formatting and analysis before submitting:
  ```bash
  dart format .
  flutter analyze
  flutter test
  ```
- Write clear commit messages using [Conventional Commits](https://www.conventionalcommits.org/)

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for more information.

---

## 📬 Contact & Acknowledgments

### Contact

**Ahmed Jalambo**

- GitHub: [@ahmedjalambo-dev](https://github.com/ahmedjalambo-dev)

<!-- Add more contact links as needed -->
<!-- - LinkedIn: [Your LinkedIn](https://linkedin.com/in/your-profile) -->
<!-- - Email: your.email@example.com -->

### Acknowledgments

- [Flutter](https://flutter.dev/) — Beautiful native apps in record time
- [Dio](https://pub.dev/packages/dio) — Powerful HTTP client for Dart
- [Retrofit](https://pub.dev/packages/retrofit) — Type-safe REST client generation
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) — Predictable state management
- [Freezed](https://pub.dev/packages/freezed) — Code generation for immutable classes
- [GetIt](https://pub.dev/packages/get_it) — Simple service locator for dependency injection
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) — Responsive UI adaptation
- [Railway](https://railway.app/) — Backend hosting and deployment

---

<div align="center">

**⭐ If you found this project helpful, please give it a star! ⭐**

Made with ❤️ by Ahmed Jalambo

</div>
