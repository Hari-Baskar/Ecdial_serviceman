import 'package:dio/dio.dart';
import 'package:jobs_app/core/network/api_endpoints.dart';
import 'package:jobs_app/core/network/dio_client.dart';
import 'package:jobs_app/core/network/network_exceptions.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/data/terms_dto.dart';

class TermsApi {
  Future<TermsDto> fetchTerms() async {
    try {
      final response = await DioClient.dio.get(ApiEndpoints.termsAndConditions);
      return TermsDto.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
