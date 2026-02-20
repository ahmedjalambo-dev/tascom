import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';

part 'create_task_service.g.dart';

@RestApi()
abstract class CreateTaskService {
  factory CreateTaskService(Dio dio) = _CreateTaskService;

  @MultiPart()
  @POST(ApiConstants.createTask)
  Future<void> createTask({
    @Part(name: 'title') required String title,
    @Part(name: 'description') required String description,
    @Part(name: 'category') required String category,
    @Part(name: 'priority') required String priority,
    @Part(name: 'latitude') double? latitude,
    @Part(name: 'longitude') double? longitude,
    @Part(name: 'deadline') String? deadline,
    @Part(name: 'file') File? file,
  });
}
