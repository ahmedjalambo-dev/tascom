import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/core/di/injection.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/storage/session_manager.dart';
import 'package:tascom/core/widgets/my_bottom_navigation_bar.dart';
import 'package:tascom/features/ai/ai_screen.dart';
import 'package:tascom/features/claim_task/cubit/claim_task_cubit.dart';
import 'package:tascom/features/get_tasks/cubit/get_tasks_cubit.dart';
import 'package:tascom/features/home/ui/home_screen.dart';
import 'package:tascom/features/search/cubit/search_cubit.dart';
import 'package:tascom/features/search/ui/search_screen.dart';
import 'package:tascom/features/profile/profile_screen.dart';
import 'package:tascom/features/profile/cubit/profile_cubit.dart';

class MyRootScreen extends StatefulWidget {
  const MyRootScreen({super.key});

  @override
  State<MyRootScreen> createState() => _MyRootScreenState();
}

class _MyRootScreenState extends State<MyRootScreen> {
  int _currentIndex = 0;
  late final GetTasksCubit _homeCubit = getIt<GetTasksCubit>()..getAllTasks();

  late final List<Widget> _screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _homeCubit),
        BlocProvider(create: (_) => getIt<ClaimTaskCubit>()),
      ],
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (_) => getIt<SearchCubit>(),
      child: const SearchScreen(),
    ),
    const AiScreen(),
    BlocProvider(
      create: (_) {
        final cubit = getIt<ProfileCubit>();
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

  Future<void> _onFabTapped() async {
    final result = await Navigator.of(context).pushNamed(MyRoutes.addTask);
    if (result == true) {
      _homeCubit.getAllTasks();
    }
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
