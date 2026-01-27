import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;

  static NetworkException fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException('Connection timeout');

      case DioExceptionType.sendTimeout:
        return NetworkException('Request timeout');

      case DioExceptionType.receiveTimeout:
        return NetworkException('Response timeout');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401) {
          return NetworkException('Unauthorized');
        } else if (statusCode == 404) {
          return NetworkException('Not found');
        } else if (statusCode == 500) {
          return NetworkException('Server error');
        }
        return NetworkException('Something went wrong');

      case DioExceptionType.cancel:
        return NetworkException('Request cancelled');

      case DioExceptionType.connectionError:
        return NetworkException('No internet connection');

      default:
        return NetworkException('Unexpected error occurred');
    }
  }
}
