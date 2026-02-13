import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/extentions/extentions.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/my_filter_dropdown.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/profile/data/profile_mock_data.dart';
import 'package:tascom/features/profile/widgets/profile_header.dart';
import 'package:tascom/features/profile/widgets/profile_stats_card.dart';
import 'package:tascom/features/profile/widgets/profile_tab_selector.dart';
import 'package:tascom/features/profile/widgets/profile_task_card.dart';
import 'package:tascom/features/user/cubit/user_cubit.dart';
import 'package:tascom/features/user/cubit/user_state.dart';
import 'package:tascom/features/user/data/models/user_model.dart';
import 'package:tascom/core/storage/session_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileTab _selectedTab = ProfileTab.posted;
  TaskStatus? _selectedStatusFilter;

  late List<TaskModel> _postedTasks;
  late List<TaskModel> _claimedTasks;

  @override
  void initState() {
    super.initState();
    _postedTasks = List.from(postedTasksMockData);
    _claimedTasks = List.from(claimedTasksMockData);
  }

  List<TaskModel> get _currentTasks {
    final tasks = _selectedTab == ProfileTab.posted
        ? _postedTasks
        : _claimedTasks;
    if (_selectedStatusFilter == null) {
      return tasks;
    }
    return tasks.where((task) => task.status == _selectedStatusFilter).toList();
  }

  void _onTabChanged(ProfileTab tab) {
    setState(() {
      _selectedTab = tab;
      _selectedStatusFilter = null;
    });
  }

  void _onStatusFilterChanged(TaskStatus? status) {
    setState(() {
      _selectedStatusFilter = status;
    });
  }

  void _onRemoveTask(TaskModel task) {
    setState(() {
      _postedTasks.removeWhere((t) => t.id == task.id);
    });
    _showSnackBar('Task removed successfully');
  }

  void _onViewApplicants(TaskModel task) {
    _showSnackBar('View applicants for: ${task.title}');
  }

  void _onCancelTask(TaskModel task) {
    setState(() {
      final index = _selectedTab == ProfileTab.posted
          ? _postedTasks.indexWhere((t) => t.id == task.id)
          : _claimedTasks.indexWhere((t) => t.id == task.id);

      if (index != -1) {
        final updatedTask = task.copyWith(
          status: TaskStatus.cancelled,
          cancelledAt: DateTime.now(),
        );

        if (_selectedTab == ProfileTab.posted) {
          _postedTasks[index] = updatedTask;
        } else {
          _claimedTasks[index] = updatedTask;
        }
      }
    });
    _showSnackBar('Task cancelled');
  }

  void _onMarkAsDone(TaskModel task) {
    setState(() {
      final index = _selectedTab == ProfileTab.posted
          ? _postedTasks.indexWhere((t) => t.id == task.id)
          : _claimedTasks.indexWhere((t) => t.id == task.id);

      if (index != -1) {
        final updatedTask = task.copyWith(status: TaskStatus.completed);

        if (_selectedTab == ProfileTab.posted) {
          _postedTasks[index] = updatedTask;
        } else {
          _claimedTasks[index] = updatedTask;
        }
      }
    });
    _showSnackBar('Task marked as completed');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.primary,
      body: Column(
        children: [
          const ProfileAppBar(),
          Expanded(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (user) => _buildProfileContent(user),
                  updateSuccess: (user) => _buildProfileContent(user),
                  error: (error) =>
                      _buildErrorState(error.message ?? 'Something went wrong'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(UserModel user) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const VerticalSpace(16),
          ProfileHeader(
            name: user.name,
            avatarUrl: user.avatar,
            rating: user.rating ?? 0.0,
            reviewCount: user.reviewCount ?? 0,
          ),
          const VerticalSpace(24),
          ProfileStatsCard(
            points: user.points ?? 0,
            postedCount: user.postedCount ?? 0,
            claimedCount: user.claimedCount ?? 0,
            completedCount: user.completedCount ?? 0,
          ),
          const VerticalSpace(24),
          ProfileTabSelector(
            selectedTab: _selectedTab,
            onTabChanged: _onTabChanged,
          ),
          const VerticalSpace(20),
          _buildTasksHeader(),
          _buildTasksList(),
          const VerticalSpace(100),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: MyColors.text.third),
            const VerticalSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
            const VerticalSpace(24),
            TextButton(
              onPressed: () {
                final userId = SessionManager.instance.currentUserId;
                if (userId != null) {
                  context.read<UserCubit>().getUser(userId);
                }
              },
              child: Text(
                'Retry',
                style: MyTextStyles.button.primaryButton1.copyWith(
                  color: MyColors.brand.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your tasks',
            style: MyTextStyles.heading.h32.copyWith(
              color: MyColors.text.primary,
            ),
          ),
          MyFilterDropdown<TaskStatus>(
            items: TaskStatus.values,
            selectedValue: _selectedStatusFilter,
            labelBuilder: (status) => status.displayName,
            allOptionLabel: 'All',
            onChanged: _onStatusFilterChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    final tasks = _currentTasks;

    if (tasks.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ProfileTaskCard(
          task: task,
          currentTab: _selectedTab,
          onRemoveTask: () => _onRemoveTask(task),
          onViewApplicants: () => _onViewApplicants(task),
          onCancelTask: () => _onCancelTask(task),
          onMarkAsDone: () => _onMarkAsDone(task),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 64.sp, color: MyColors.text.third),
          const VerticalSpace(16),
          Text(
            'No tasks found',
            style: MyTextStyles.body.body1.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Text(
        'Profile',
        style: MyTextStyles.heading.h22.copyWith(color: MyColors.text.primary),
      ),
      trailing: [
        GestureDetector(
          onTap: () {
            context.pushNamed(MyRoutes.settings);
          },
          child: SvgPicture.asset(
            MyIcons.settingsStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              MyColors.text.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
