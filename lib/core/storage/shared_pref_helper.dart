import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_keys.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static late SharedPreferences _prefs;

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// Initialize SharedPreferences - call this in main()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ============ Secure Token Storage ============

  /// Save access token securely
  static Future<void> setAccessToken(String token) async {
    await _secureStorage.write(key: SharedPrefKeys.accessToken, value: token);
  }

  /// Get access token
  static Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: SharedPrefKeys.accessToken);
  }

  /// Save refresh token securely
  static Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: SharedPrefKeys.refreshToken, value: token);
  }

  /// Get refresh token
  static Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: SharedPrefKeys.refreshToken);
  }

  /// Clear all tokens
  static Future<void> clearTokens() async {
    await _secureStorage.delete(key: SharedPrefKeys.accessToken);
    await _secureStorage.delete(key: SharedPrefKeys.refreshToken);
  }

  // ============ User Info Storage ============

  /// Save user ID
  static Future<void> setUserId(String userId) async {
    await _prefs.setString(SharedPrefKeys.userId, userId);
  }

  /// Get user ID
  static String? getUserId() {
    return _prefs.getString(SharedPrefKeys.userId);
  }

  /// Save user email
  static Future<void> setUserEmail(String email) async {
    await _prefs.setString(SharedPrefKeys.userEmail, email);
  }

  /// Get user email
  static String? getUserEmail() {
    return _prefs.getString(SharedPrefKeys.userEmail);
  }

  /// Save user name
  static Future<void> setUserName(String name) async {
    await _prefs.setString(SharedPrefKeys.userName, name);
  }

  /// Get user name
  static String? getUserName() {
    return _prefs.getString(SharedPrefKeys.userName);
  }

  /// Save user avatar URL
  static Future<void> setUserAvatar(String avatar) async {
    await _prefs.setString(SharedPrefKeys.userAvatar, avatar);
  }

  /// Get user avatar URL
  static String? getUserAvatar() {
    return _prefs.getString(SharedPrefKeys.userAvatar);
  }

  /// Save user location
  static Future<void> setUserLocation(String location) async {
    await _prefs.setString(SharedPrefKeys.userLocation, location);
  }

  /// Get user location
  static String? getUserLocation() {
    return _prefs.getString(SharedPrefKeys.userLocation);
  }

  // ============ App Preferences ============

  /// Check if first launch
  static bool isFirstLaunch() {
    return _prefs.getBool(SharedPrefKeys.isFirstLaunch) ?? true;
  }

  /// Set first launch completed
  static Future<void> setFirstLaunchCompleted() async {
    await _prefs.setBool(SharedPrefKeys.isFirstLaunch, false);
  }

  /// Get language code
  static String? getLanguageCode() {
    return _prefs.getString(SharedPrefKeys.languageCode);
  }

  /// Set language code
  static Future<void> setLanguageCode(String code) async {
    await _prefs.setString(SharedPrefKeys.languageCode, code);
  }

  // ============ Recent Searches ============

  static List<String> getRecentSearches() {
    return _prefs.getStringList(SharedPrefKeys.recentSearches) ?? [];
  }

  static Future<void> setRecentSearches(List<String> searches) async {
    await _prefs.setStringList(SharedPrefKeys.recentSearches, searches);
  }

  // ============ Clear All ============

  /// Clear all stored data (logout)
  static Future<void> clearAll() async {
    await _secureStorage.deleteAll();
    await _prefs.clear();
  }

  /// Clear user-specific data (keeps app preferences)
  static Future<void> clearUserData() async {
    await clearTokens();
    await _prefs.remove(SharedPrefKeys.userId);
    await _prefs.remove(SharedPrefKeys.userEmail);
    await _prefs.remove(SharedPrefKeys.userName);
    await _prefs.remove(SharedPrefKeys.userLocation);
    await _prefs.remove(SharedPrefKeys.userAvatar);
  }
}
