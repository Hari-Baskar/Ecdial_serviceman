import 'terms_api.dart';

class TermsRepository {
  final TermsApi api;

  TermsRepository(this.api);

  Future<String> getTermsHtml() async {
    final result = await api.fetchTerms();

    if (result.status != 1) {
      throw Exception('Failed to load terms');
    }

    return result.html;
  }
}
