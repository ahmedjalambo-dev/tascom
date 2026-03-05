import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';
import 'package:tascom/core/widgets/dialogs/claim_confirmation_dialog.dart';

import '../../../core/extentions/extentions.dart';
import '../../../core/routes/my_routes.dart';
import '../../../core/storage/shared_pref_helper.dart';
import '../../claim_task/cubit/claim_task_cubit.dart';
import '../../claim_task/cubit/claim_task_state.dart';
import '../../home/data/models/task_model.dart';
import '../../home/ui/widgets/posts/task_card.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../data/models/map_task_mapper.dart';
import '../data/models/map_tasks_response.dart';
import 'widgets/map_error_view.dart';
import 'widgets/task_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  TaskModel? _selectedTask;

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

  void _openTaskDetails(TaskModel task) =>
      context.pushNamed(MyRoutes.taskDetails, arguments: task);

  Future<void> _handleClaimTask(String taskId) async {
    final confirmed = await showClaimConfirmationDialog(context);
    if (confirmed == true && mounted) {
      context.read<ClaimTaskCubit>().claimTask(taskId);
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
    final claimState = context.watch<ClaimTaskCubit>().state;
    final isClaimLoading = _selectedTask != null
        ? claimState.maybeWhen(
            loading: (taskId) => taskId == _selectedTask!.id,
            orElse: () => false,
          )
        : false;

    return Scaffold(
      body: BlocListener<ClaimTaskCubit, ClaimTaskState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: (_) {},
            success: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Task claimed successfully!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.read<MapCubit>().getMapTasks();
              _dismissPopup();
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message ?? 'Failed to claim task'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          );
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
            // Zoom & reposition controls
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
                child: TaskCard(
                  taskModel: _selectedTask!,
                  isClaimLoading: isClaimLoading,
                  onTap: () => _openTaskDetails(_selectedTask!),
                  onClaimTap: _selectedTask!.isClaimed
                      ? null
                      : () => _handleClaimTask(_selectedTask!.id),
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
