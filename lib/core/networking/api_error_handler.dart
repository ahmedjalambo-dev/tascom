import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is ApiErrorModel) {
      return error;
    }
    return const ApiErrorModel(message: 'An unexpected error occurred');
  }

  static ApiErrorModel _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiErrorModel(
          message: 'Connection timeout. Please check your internet connection.',
        );
      case DioExceptionType.sendTimeout:
        return const ApiErrorModel(
          message: 'Send timeout. Please try again.',
        );
      case DioExceptionType.receiveTimeout:
        return const ApiErrorModel(
          message: 'Receive timeout. Please try again.',
        );
      case DioExceptionType.badCertificate:
        return const ApiErrorModel(
          message: 'Invalid certificate. Please contact support.',
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return const ApiErrorModel(
          message: 'Request was cancelled.',
        );
      case DioExceptionType.connectionError:
        return const ApiErrorModel(
          message: 'No internet connection. Please check your network.',
        );
      case DioExceptionType.unknown:
        return const ApiErrorModel(
          message: 'An unexpected error occurred. Please try again.',
        );
    }
  }

  static ApiErrorModel _handleBadResponse(Response? response) {
    if (response == null) {
      return const ApiErrorModel(message: 'No response from server');
    }

    final statusCode = response.statusCode;
    final data = response.data;

    // Try to parse error from response body
    if (data != null && data is Map<String, dynamic>) {
      try {
        final apiError = ApiErrorModel.fromJson(data);
        return apiError.copyWith(statusCode: statusCode);
      } catch (_) {
        // If parsing fails, create error from status code
      }
    }

    // Handle common HTTP status codes
    switch (statusCode) {
      case 400:
        return ApiErrorModel(
          message: 'Bad request. Please check your input.',
          statusCode: statusCode,
        );
      case 401:
        return ApiErrorModel(
          message: 'Unauthorized. Please login again.',
          statusCode: statusCode,
        );
      case 403:
        return ApiErrorModel(
          message: 'Access denied. You do not have permission.',
          statusCode: statusCode,
        );
      case 404:
        return ApiErrorModel(
          message: 'Resource not found.',
          statusCode: statusCode,
        );
      case 409:
        return ApiErrorModel(
          message: 'Conflict. This resource already exists.',
          statusCode: statusCode,
        );
      case 422:
        return ApiErrorModel(
          message: 'Validation error. Please check your input.',
          statusCode: statusCode,
        );
      case 500:
        return ApiErrorModel(
          message: 'Internal server error. Please try again later.',
          statusCode: statusCode,
        );
      case 502:
        return ApiErrorModel(
          message: 'Bad gateway. Please try again later.',
          statusCode: statusCode,
        );
      case 503:
        return ApiErrorModel(
          message: 'Service unavailable. Please try again later.',
          statusCode: statusCode,
        );
      default:
        return ApiErrorModel(
          message: 'Server error occurred. Please try again.',
          statusCode: statusCode,
        );
    }
  }
}
