import 'package:flutter/material.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/widgets/my_bottom_navigation_bar.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/profile/ui/screen/profile_screen.dart';
import 'package:tascom/features/search/ui/search_screen.dart';
import 'package:tascom/features/ai/ui/ai_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
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
    Navigator.of(context).pushNamed(MyRoutes.addPost);
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
