import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/services/location_service.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/core/storage/shared_pref_helper.dart';
import 'package:tascom/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  await SharedPrefHelper.init();

  // Initialize session manager
  await SessionManager.instance.initialize();

  // Trigger location fetch (fire and forget)
  LocationService.getCurrentLocation();

  // Initialize dependency injection
  await initDependencies();

  // Set the system UI mode to edge-to-edge,
  // making the navigation bar and status bar transparent
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}
