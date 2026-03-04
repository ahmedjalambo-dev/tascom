# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Install dependencies
flutter pub get

# Code generation (retrofit, freezed, json_serializable)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs  # Watch mode

# Run the app
flutter run

# Analysis and formatting
flutter analyze
dart format .

# Run tests
flutter test
flutter test test/path/to/specific_test.dart  # Single test file

# Build release
flutter build apk
flutter build ios
```

## Architecture Overview

**Feature-Driven Structure** under `lib/`:
- `core/` - Shared infrastructure: networking, DI, routing, themes, widgets, storage, helpers, extensions
- `features/` - Feature modules, each following a vertical-slice pattern

**Feature module structure** (e.g., `features/auth/login/`):
```
feature_name/
├── cubit/          # feature_cubit.dart, feature_state.dart
├── data/
│   ├── models/     # request/response DTOs (Freezed + json_serializable)
│   ├── repos/      # Repository wrapping service, returns ApiResult<T>
│   └── services/   # Retrofit service interface (@RestApi)
└── ui/             # Screens and feature-specific widgets
```

**Data flow**: UI → Cubit → Repo → Retrofit Service → Dio → API

**Note**: `home/` and `onboarding/` still use StatefulWidget with mock data (Cubit migration pending). `ai/`, `chat/`, and `map/` are placeholder features with no implementation yet. `profile/` now uses real API data for tasks via `GetMyTasksCubit` and `GetMyClaimsCubit`.

## Feature Modules

All feature modules live under `lib/features/`, grouped by domain:

| Domain | Modules |
|--------|---------|
| **Auth** | `login`, `register`, `google_login`, `logout`, `forgot_password`, `reset_password` |
| **Tasks** | `get_tasks`, `create_task`, `claim_task`, `save_task` (data layer only, no Cubit), `get_my_tasks`, `get_my_claims` |
| **Comments** | `get_comments`, `create_comment`, `delete_comment` |
| **User/Profile** | `user` (models only), `profile`, `search` |
| **Settings** | `edit_profile`, `delete_account`, `logout`, `points_history`, `reports`, `requests` |
| **Placeholders** | `ai`, `chat`, `map` (no implementation) |
| **Legacy** | `home`, `onboarding` (StatefulWidget, no Cubit) |

## State Management (Cubit + Freezed)

All Cubit states use Freezed sealed unions with a consistent pattern:

```dart
@freezed
abstract class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = _Initial;
  const factory FeatureState.loading() = _Loading;
  const factory FeatureState.success(ResponseType response) = _Success;
  const factory FeatureState.error(ApiErrorModel error) = _Error;
}
```

Active Cubits:
- **Auth (6)**: `LoginCubit`, `RegisterCubit`, `GoogleLoginCubit`, `LogoutCubit`, `ForgotPasswordCubit`, `ResetPasswordCubit`
- **Tasks (5)**: `GetTasksCubit`, `CreateTaskCubit`, `ClaimTaskCubit`, `GetMyTasksCubit`, `GetMyClaimsCubit`
- **Comments (3)**: `GetCommentsCubit`, `CreateCommentCubit`, `DeleteCommentCubit`
- **User/Profile (5)**: `UserCubit`, `ProfileCubit`, `SearchCubit`, `EditProfileCubit`, `DeleteAccountCubit`

Pagination-capable Cubits (e.g., `GetTasksCubit`) add a `.loadingMore()` state variant and expose `loadMore()` / `hasMorePages`. Internal state (`_currentPage`, `_limit`, `_allTasks`) is managed inside the Cubit.

## Networking

- **HTTP client**: Dio with 30s timeouts, configured in `core/networking/dio_factory.dart`
- **API client**: Retrofit with `@RestApi()` annotations, code-generated implementations
- **Base URL**: `https://tascom.up.railway.app/` (hardcoded in `core/networking/api_constants.dart`)
- **Auth interceptor**: Automatically injects `Authorization: Bearer <token>` on all non-public requests
- **Error handling**: `ApiErrorHandler.handle()` converts DioException → `ApiErrorModel` (Freezed). Repos return `ApiResult<T>` sealed class: `success(data)` or `failure(ApiErrorModel)`

## Dependency Injection

GetIt service locator configured in `core/di/injection.dart`:
- Services/Repos: `registerLazySingleton`
- Cubits: `registerFactory` (new instance per injection point)
- Routes that need a Cubit wrap their screen in `BlocProvider(create: (_) => getIt<XCubit>())`

## Session & Storage

- **Tokens** (access/refresh): `FlutterSecureStorage` (Android Keystore / iOS Keychain)
- **User data** (userId, email, name, location): `SharedPreferences` via `SharedPrefHelper`
- **Session state**: `SessionManager` singleton with `StreamController<AuthState>.broadcast()`
- **App init order** (`main.dart`): SharedPrefHelper.init → SessionManager.initialize → LocationService.getCurrentLocation → initDependencies → runApp

## Routing

- Route constants: `core/routes/my_routes.dart` (e.g., `MyRoutes.login`, `MyRoutes.root`)
- Route generation: `MyRouter.generateRoute(RouteSettings)` switch-based in `core/routes/my_router.dart`
- Navigation: `context.pushNamed()`, `context.pushReplacementNamed()`, `context.pop()` extensions from `core/extentions/extentions.dart`
- Initial route: `MyRoutes.root` if authenticated, `MyRoutes.login` otherwise

## Design System

- Responsive UI: flutter_screenutil with design size 375×812
- Colors: `core/themes/my_colors.dart`
- Text styles: `core/themes/my_text_styles.dart`
- Font: Poppins (sole font family, weights 100-900)
- Icons: SVG-based, paths in `core/constants/my_icons.dart`
- Reusable widgets: `My`-prefixed in `core/widgets/` (MyButton, MyTextField, MyAppBar, MyDropDown, etc.)

## Key Conventions

- Widget naming: Shared widgets prefixed with `My`
- File naming: `snake_case` — screens as `*_screen.dart`, cubits as `*_cubit.dart`/`*_state.dart`, services as `*_service.dart`, repos as `*_repo.dart`, models as `*_request.dart`/`*_response.dart`/`*_model.dart`
- Form validation: `Validator` class from `core/helpers/validator.dart`
- Enums: Domain enums (TaskPriority, TaskStatus, TaskCategory) expose `displayName`, `backgroundColor`, `textColor`, `icon` via extensions
- Data models: Freezed + json_serializable for API models; manual classes with `copyWith()` for mock/UI models (home feature)
- **Pagination pattern**: Add `.loadingMore()` state + `loadMore()`/`hasMorePages` to paginated Cubits; cache accumulated results internally
- **Reset pattern**: Mutation Cubits (`CreateCommentCubit`, `DeleteCommentCubit`) expose `reset()` to return to `.initial()` after an operation completes
- **Multi-mode Cubit**: `SearchCubit` handles two result types with separate success states (`.tasksSuccess()`, `.peopleSuccess()`); persists recent searches via `SharedPrefHelper`

## CI/CD

GitHub Actions (`.github/workflows/flutter_ci.yml`) runs on PRs to main/dev:
1. `dart format --output=none --set-exit-if-changed .`
2. `flutter analyze`
3. `flutter test`

## Linting

Configured in `analysis_options.yaml`:
- Base: `package:flutter_lints/flutter.yaml`
- `avoid_print: false` — print statements allowed
- `prefer_const_constructors: true`
- `prefer_final_locals: true`
- `invalid_annotation_target: ignore` — suppresses Freezed annotation warnings

## Known Folder Typos

These misspellings exist in the codebase and should be matched when referencing them:
- `core/extentions/` (not "extensions")
- `home/ui/widgets/categoies/` (not "categories")
- API endpoint `auth/forgot-passward` (backend typo, preserved in `ApiConstants`)


## Important Note
After major changes, please update this file (CLAUDE.md). Keep this file up-to-date with the project's status.