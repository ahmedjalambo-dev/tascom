import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tascom/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
