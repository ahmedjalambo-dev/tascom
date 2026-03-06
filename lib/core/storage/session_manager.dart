import 'dart:async';

import 'shared_pref_helper.dart';

enum AuthState { initial, authenticated, unauthenticated }

class SessionManager {
  SessionManager._();

  static final SessionManager _instance = SessionManager._();
  static SessionManager get instance => _instance;

  final _authStateController = StreamController<AuthState>.broadcast();
  Stream<AuthState> get authStateStream => _authStateController.stream;

  AuthState _currentState = AuthState.initial;
  AuthState get currentState => _currentState;

  String? _currentUserId;
  String? get currentUserId => _currentUserId;

  String? _currentUserEmail;
  String? get currentUserEmail => _currentUserEmail;

  String? _currentUserName;
  String? get currentUserName => _currentUserName;

  /// Initialize session manager - call this after SharedPrefHelper.init()
  Future<void> initialize() async {
    final token = await SharedPrefHelper.getAccessToken();
    _currentUserId = SharedPrefHelper.getUserId();
    _currentUserEmail = SharedPrefHelper.getUserEmail();
    _currentUserName = SharedPrefHelper.getUserName();

    _currentState = (token != null && token.isNotEmpty)
        ? AuthState.authenticated
        : AuthState.unauthenticated;

    _authStateController.add(_currentState);
  }

  /// Set session after successful login/register
  Future<void> setSession({
    required String accessToken,
    required String refreshToken,
    required String userId,
    String? email,
    String? name,
    String? avatar,
  }) async {
    await SharedPrefHelper.setAccessToken(accessToken);
    await SharedPrefHelper.setRefreshToken(refreshToken);
    await SharedPrefHelper.setUserId(userId);

    if (email != null) {
      await SharedPrefHelper.setUserEmail(email);
    }
    if (name != null) {
      await SharedPrefHelper.setUserName(name);
    }
    if (avatar != null) {
      await SharedPrefHelper.setUserAvatar(avatar);
    }

    _currentUserId = userId;
    _currentUserEmail = email;
    _currentUserName = name;
    _currentState = AuthState.authenticated;

    _authStateController.add(_currentState);
  }

  /// Clear session on logout
  Future<void> clearSession() async {
    await SharedPrefHelper.clearUserData();

    _currentUserId = null;
    _currentUserEmail = null;
    _currentUserName = null;
    _currentState = AuthState.unauthenticated;

    _authStateController.add(_currentState);
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _currentState == AuthState.authenticated;

  /// Dispose the stream controller
  void dispose() {
    _authStateController.close();
  }
}
