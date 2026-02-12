import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/core/widgets/my_bottom_navigation_bar.dart';
import 'package:tascom/features/ai/ai_screen.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/search/ui/search_screen.dart';
import 'package:tascom/features/profile/profile_screen.dart';
import 'package:tascom/features/user/cubit/user_cubit.dart';

class MyRootScreen extends StatefulWidget {
  const MyRootScreen({super.key});

  @override
  State<MyRootScreen> createState() => _MyRootScreenState();
}

class _MyRootScreenState extends State<MyRootScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AiScreen(),
    BlocProvider(
      create: (_) {
        final cubit = getIt<UserCubit>();
        final userId = SessionManager.instance.currentUserId;
        if (userId != null) {
          cubit.getUser(userId);
        }
        return cubit;
      },
      child: const ProfileScreen(),
    ),
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
