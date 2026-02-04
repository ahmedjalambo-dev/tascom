class SharedPrefKeys {
  SharedPrefKeys._();

  // Auth tokens (stored securely)
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';

  // User info
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';

  // App preferences
  static const String isFirstLaunch = 'is_first_launch';
  static const String languageCode = 'language_code';
  static const String themeMode = 'theme_mode';
  static const String userLocation = 'user_location';
}
