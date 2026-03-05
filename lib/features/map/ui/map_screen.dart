import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_app_bar.dart';

import '../../../core/extentions/extentions.dart';
import '../../../core/routes/my_routes.dart';
import '../../../core/storage/shared_pref_helper.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';
import '../data/models/map_task_mapper.dart';
import '../data/models/map_tasks_response.dart';
import 'widgets/map_error_view.dart';
import 'widgets/task_marker.dart';
import 'widgets/task_popup.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  MapTaskData? _selectedTask;

  void _onMarkerTapped(MapTaskData task) =>
      setState(() => _selectedTask = task);

  void _dismissPopup() => setState(() => _selectedTask = null);

  void _openTaskDetails(MapTaskData task) =>
      context.pushNamed(MyRoutes.taskDetails, arguments: task.toTaskModel());

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
      body: Stack(
        children: [
          _MapLayer(
            mapController: _mapController,
            buildMarkers: _buildMarkers,
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
              IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
            ],
          ),
          if (_selectedTask != null)
            Positioned(
              bottom: 120.h,
              left: 16.w,
              right: 16.w,
              child: TaskPopup(
                task: _selectedTask!,
                onViewDetails: () => _openTaskDetails(_selectedTask!),
                onDismiss: _dismissPopup,
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
    );
  }
}

class _MapLayer extends StatelessWidget {
  final MapController mapController;
  final List<Marker> Function(List<MapTaskData>) buildMarkers;
  final VoidCallback onTap;

  const _MapLayer({
    required this.mapController,
    required this.buildMarkers,
    required this.onTap,
  });

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final markers = state is MapSuccess
            ? buildMarkers(state.response.data.data)
            : <Marker>[];

        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: _getUserLocation(),
            initialZoom: 14.0,
            onTap: (_, _) => onTap(),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.tascom.app',
            ),
            MarkerLayer(markers: markers),
          ],
        );
      },
    );
  }
}
