class ApiConstants {
  ApiConstants._();

  // Base URL - Update with actual API URL
  static const String baseUrl = 'https://tascom.up.railway.app/';

  // Auth endpoints
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String googleLogin = 'auth/google-login';
  static const String logout = 'auth/logout';
  static const String forgotPassword =
      'auth/forgot-passward'; // Note: API typo preserved
  static const String resetPassword = 'auth/reset-password';

  // User endpoints
  static const String users = 'users';

  // Task endpoints
  static const String tasks = 'tasks';
  static const String createTask = 'tasks/Create-Task';

  // Comments endpoints
  static const String comments = 'comments';
  static const String commentsTask = 'comments/task';

  // Search endpoint
  static const String search = 'search';

  // Task Claims endpoints
  static const String taskClaims = 'task-claims';

  // Endpoints that don't require authentication
  static const List<String> publicEndpoints = [
    login,
    register,
    googleLogin,
    forgotPassword,
    resetPassword,
  ];

  // Helper to check if endpoint is public
  static bool isPublicEndpoint(String path) {
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
