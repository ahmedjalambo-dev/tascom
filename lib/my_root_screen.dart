import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/widgets/my_bottom_navigation_bar.dart';
import 'package:tascom/features/ai/ai_screen.dart';
import 'package:tascom/features/home/home_screen.dart';
import 'package:tascom/features/search/search_screen.dart';
import 'package:tascom/features/user/profile_screen.dart';

class MyRootScreen extends StatefulWidget {
  const MyRootScreen({super.key});

  @override
  State<MyRootScreen> createState() => _MyRootScreenState();
}

class _MyRootScreenState extends State<MyRootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    AiScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onFabTapped() {
    Navigator.of(context).pushNamed(MyRoutes.addTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        onFabTap: _onFabTapped,
      ),
    );
  }
}
