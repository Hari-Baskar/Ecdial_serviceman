import 'package:flutter_riverpod/legacy.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/data/privacy_policy_repository.dart';
import 'privacy_policy_state.dart';

class PrivacyPolicyNotifier extends StateNotifier<PrivacyPolicyState> {
  final PrivacyPolicyRepository repository;

  PrivacyPolicyNotifier(this.repository)
      : super(const PrivacyPolicyState.loading());

  Future<void> fetchPrivacyPolicy() async {
    try {
      state = const PrivacyPolicyState.loading();

      final html = await repository.getPrivacyPolicyHtml();

      state = PrivacyPolicyState.data(html);
    } catch (e) {
      state = PrivacyPolicyState.error(e.toString());
    }
  }
}
