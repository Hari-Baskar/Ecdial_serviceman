import 'privacy_policy_api.dart';

class PrivacyPolicyRepository {
  final PrivacyPolicyApi api;

  PrivacyPolicyRepository(this.api);

  Future<String> getPrivacyPolicyHtml() async {
    final result = await api.fetchPrivacyPolicy();

    if (result.status != 1) {
      throw Exception('Failed to load privacy policy');
    }

    return result.data;
  }
}
