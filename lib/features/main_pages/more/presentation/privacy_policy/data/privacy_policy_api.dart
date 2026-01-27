import 'package:dio/dio.dart';
import 'package:jobs_app/core/network/api_endpoints.dart';
import 'package:jobs_app/core/network/dio_client.dart';
import 'package:jobs_app/core/network/network_exceptions.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/data/privacy_policy_dto.dart';

class PrivacyPolicyApi {
  Future<PrivacyPolicyDto> fetchPrivacyPolicy() async {
    try {
      final response = await DioClient.dio.get(ApiEndpoints.privacyPolicy);
      return PrivacyPolicyDto.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
