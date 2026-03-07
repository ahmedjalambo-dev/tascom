import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';

import '../../../core/di/injection.dart';
import '../../../core/routes/my_routes.dart';
import '../../../core/storage/session_manager.dart';
import '../../../core/storage/shared_pref_helper.dart';
import '../../get_task/cubit/get_task_cubit.dart';
import '../../get_task/cubit/get_task_state.dart';
import '../../home/data/models/task_category.dart';
import '../../home/data/models/task_location.dart';
import '../../home/data/models/task_metrics.dart';
import '../../home/data/models/task_model.dart';
import '../../home/data/models/task_priority.dart';
import '../../home/data/models/task_status.dart';
import '../../home/data/models/user_model.dart';
import '../../profile/data/services/profile_service.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../data/models/map_task_mapper.dart';
import '../data/models/map_tasks_response.dart';
import 'widgets/map_error_view.dart';
import 'widgets/map_task_card.dart';
import 'widgets/task_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  TaskModel? _selectedTask;
  bool _isFetchingTask = false;

  LatLng _getUserLocation() {
    final locationStr = SharedPrefHelper.getUserLocation();
    if (locationStr != null) {
      final parts = locationStr.split(',');
      if (parts.length == 2) {
        final lat = double.tryParse(parts[0]);
        final lng = double.tryParse(parts[1]);
        if (lat != null && lng != null) return LatLng(lat, lng);
      }
    }
    return const LatLng(31.44, 34.40);
  }

  void _onMarkerTapped(MapTaskData task) =>
      setState(() => _selectedTask = task.toTaskModel());

  void _dismissPopup() => setState(() => _selectedTask = null);

  void _onCardTapped() {
    if (_selectedTask == null || _isFetchingTask) return;
    final id = int.tryParse(_selectedTask!.id);
    if (id == null) return;
    context.read<GetTaskCubit>().getTask(id);
  }

  Future<TaskModel> _toTaskModel(
    GetTaskSuccess state,
  ) async {
    final data = state.data;
    final currentUserId = SessionManager.instance.currentUserId;

    // Fetch creator info
    String creatorName = 'Unknown';
    String? creatorAvatar;
    double creatorRating = 0;
    try {
      final profileService = getIt<ProfileService>();
      final userResponse = await profileService.getUser(data.creatorId);
      creatorName = userResponse.data.name;
      creatorAvatar = userResponse.data.avatar;
      creatorRating = userResponse.data.rating ?? 0;
    } catch (_) {}

    return TaskModel(
      id: data.id,
      author: UserModel(
        id: data.creatorId,
        name: creatorName,
        avatar: creatorAvatar,
        rating: creatorRating,
      ),
      createdAt: DateTime.parse(data.createdAt),
      title: data.title,
      description: data.description,
      category: TaskCategory.fromApiValue(data.category),
      priority: TaskPriority.fromApiValue(data.priority),
      status: TaskStatus.fromApiValue(data.status),
      location: TaskLocation(
        name: 'Nearby',
        latitude: data.latitude,
        longitude: data.longitude,
      ),
      duration: _formatDeadline(data.deadline),
      metrics: TaskMetrics(points: data.pointsOffered ?? 0, distance: 0),
      imageUrl: data.assets.isNotEmpty ? data.assets[0]['url'] as String? : null,
      likeCount: data.numOfLikes ?? 0,
      commentCount: 0,
      isClaimed: currentUserId != null &&
          data.claims.any(
            (c) => c.claimantId == currentUserId && c.status == 'PENDING',
          ),
      isLiked: data.isLiked ?? false,
      isSaved: data.isSaved ?? false,
    );
  }

  String _formatDeadline(String? deadline) {
    if (deadline == null) return 'No deadline';
    try {
      final deadlineDate = DateTime.parse(deadline);
      final now = DateTime.now();
      final difference = deadlineDate.difference(now);
      if (difference.isNegative) return 'Expired';
      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
      }
      if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
      }
      return 'Less than 1 hour';
    } catch (_) {
      return 'No deadline';
    }
  }

  List<Marker> _buildMarkers(List<MapTaskData> tasks) {
    return tasks
        .where((t) => t.latitude != null && t.longitude != null)
        .map(
          (task) => Marker(
            point: LatLng(task.latitude!, task.longitude!),
            width: 40.w,
            height: 40.w,
            child: TaskMarker(
              points: task.pointsOffered ?? 0,
              isSelected: _selectedTask?.id == task.id,
              onTap: () => _onMarkerTapped(task),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GetTaskCubit, GetTaskState>(
        listener: (context, state) async {
          if (state is GetTaskLoading) {
            setState(() => _isFetchingTask = true);
          } else if (state is GetTaskSuccess) {
            final navigator = Navigator.of(context);
            final taskModel = await _toTaskModel(state);
            setState(() => _isFetchingTask = false);
            if (mounted) {
              navigator.pushNamed(MyRoutes.taskDetails, arguments: taskModel);
            }
          } else if (state is GetTaskError) {
            setState(() => _isFetchingTask = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.message ?? 'Failed to load task'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Stack(
          children: [
          _MapLayer(
            mapController: _mapController,
            buildMarkers: _buildMarkers,
            userLocation: _getUserLocation(),
            onTap: _dismissPopup,
          ),
          MyAppBar(
            title: Text(
              'Map',
              style: MyTextStyles.heading.h22.copyWith(
                color: MyColors.text.primary,
              ),
            ),
            trailing: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => context.read<MapCubit>().getMapTasks(),
              ),
            ],
          ),
          Positioned(
            bottom: 100.h,
            right: 16.w,
            child: _MapControls(
              onZoomIn: () {
                final zoom = _mapController.camera.zoom;
                _mapController.move(_mapController.camera.center, zoom + 1);
              },
              onZoomOut: () {
                final zoom = _mapController.camera.zoom;
                _mapController.move(_mapController.camera.center, zoom - 1);
              },
              onMyLocation: () {
                _mapController.move(_getUserLocation(), 14.0);
              },
            ),
          ),
          if (_selectedTask != null)
            Positioned(
              bottom: 120.h,
              left: 16.w,
              right: 16.w,
              child: _isFetchingTask
                  ? Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: MyColors.background.primary,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: MyColors.border.postBorder,
                          width: 1,
                        ),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : MapTaskCard(
                      taskModel: _selectedTask!,
                      onTap: _onCardTapped,
                    ),
            ),
          BlocBuilder<MapCubit, MapState>(
            builder: (context, state) {
              if (state is MapLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox.shrink();
            },
          ),
          const MapErrorView(),
        ],
        ),
      ),
    );
  }
}

class _MapLayer extends StatelessWidget {
  final MapController mapController;
  final List<Marker> Function(List<MapTaskData>) buildMarkers;
  final LatLng userLocation;
  final VoidCallback onTap;

  const _MapLayer({
    required this.mapController,
    required this.buildMarkers,
    required this.userLocation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final taskMarkers = state is MapSuccess
            ? buildMarkers(state.response.data.data)
            : <Marker>[];

        final userMarker = Marker(
          point: userLocation,
          width: 20.w,
          height: 20.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );

        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: userLocation,
            initialZoom: 14.0,
            onTap: (_, _) => onTap(),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.tascom.app',
            ),
            MarkerLayer(markers: [...taskMarkers, userMarker]),
          ],
        );
      },
    );
  }
}

class _MapControls extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onMyLocation;

  const _MapControls({
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onMyLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ControlButton(icon: Icons.add, onTap: onZoomIn),
        SizedBox(height: 8.h),
        _ControlButton(icon: Icons.remove, onTap: onZoomOut),
        SizedBox(height: 8.h),
        _ControlButton(icon: Icons.my_location, onTap: onMyLocation),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20.w, color: MyColors.text.primary),
      ),
    );
  }
}
