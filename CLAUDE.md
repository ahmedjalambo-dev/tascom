# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Install dependencies
flutter pub get

# Run code generation (retrofit, freezed, json_serializable)
flutter pub run build_runner build
flutter pub run build_runner watch  # Watch mode for continuous generation

# Run the app
flutter run

# Analysis and formatting
flutter analyze
dart format .

# Run tests
flutter test

# Build release
flutter build apk
flutter build ios
```

## Architecture Overview

**Feature-Driven Structure**: The app follows a feature-based architecture under `lib/`:
- `core/` - Shared constants, themes, routes, widgets, helpers, and extensions
- `features/` - Feature modules (home, registration, search, ai, user, chat, map)

**State Management**: Currently uses StatefulWidget with mock data. flutter_bloc is included for future BLoC pattern implementation.

**Routing**: Named routes defined in `core/routes/my_routes.dart`, generated via `MyRouter.generateRoute()` in `my_router.dart`. Navigation helpers are provided through extensions in `core/extentions/extentions.dart`.

**Design System**:
- Responsive UI with flutter_screenutil (design size: 375x812)
- Colors in `core/themes/my_colors.dart`
- Text styles in `core/themes/my_text_styles.dart`
- Reusable widgets prefixed with `My` in `core/widgets/`

**Data Layer**:
- Models in `features/home/data/models/` with copyWith() for immutability
- Enums with extensions providing displayName, colors, and icons
- Mock data files for development (task_mock_data.dart, comments_mock_data.dart)

## Key Conventions

- Widget naming: Prefix shared widgets with `My` (MyButton, MyTextField, MyAppBar)
- Icons: SVG-based, paths centralized in `core/constants/my_icons.dart`
- Routes: Constants in `my_routes.dart`, use `context.pushNamed()` extension for navigation
- Form validation: Use `Validator` class from `core/helpers/validator.dart`

## CI/CD

GitHub Actions workflow (`.github/workflows/flutter_ci.yml`) runs on PRs to main/dev:
1. `dart format --output=none --set-exit-if-changed .`
2. `flutter analyze`
3. `flutter test`

## Linting

Configured in `analysis_options.yaml`:
- Base: `package:flutter_lints/flutter.yaml`
- `avoid_print: false` - print statements allowed
- `prefer_const_constructors: true`
- `prefer_final_locals: true`
