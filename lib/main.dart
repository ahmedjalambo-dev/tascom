import 'package:flutter/material.dart';
import 'package:tascom/features/profile/ui/screen/edit_profile_screen.dart';
import 'package:tascom/features/profile/ui/screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
 
 
      ),
      home: ProfileScreen()


    );
  }
}

