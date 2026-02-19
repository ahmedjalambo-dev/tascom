import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../user/data/models/user_response.dart';

part 'edit_profile_service.g.dart';

@RestApi()
abstract class EditProfileService {
  factory EditProfileService(Dio dio) = _EditProfileService;

  @GET('${ApiConstants.users}/{id}')
  Future<UserResponse> getUser(@Path('id') String id);

  @MultiPart()
  @PATCH('${ApiConstants.users}/{id}')
  Future<UserResponse> updateUser(
    @Path('id') String id, {
    @Part(name: 'name') String? name,
    @Part(name: 'email') String? email,
    @Part(name: 'location') String? location,
    @Part(name: 'phoneNumber') String? phoneNumber,
    @Part(name: 'about') String? about,
    @Part(name: 'skills') String? skills,
    @Part(name: 'DOB') String? dateOfBirth,
    @Part(name: 'gender') String? gender,
    @Part(name: 'file') File? file,
  });
}
