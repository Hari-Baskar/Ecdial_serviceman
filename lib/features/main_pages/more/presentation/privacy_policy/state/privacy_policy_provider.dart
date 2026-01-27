import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/data/privacy_policy_api.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/data/privacy_policy_repository.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/state/privacy_policy_notifier.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/state/privacy_policy_state.dart';

final privacyPolicyApiProvider = Provider<PrivacyPolicyApi>((ref) {
  return PrivacyPolicyApi();
});

final privacyPolicyRepositoryProvider =
    Provider<PrivacyPolicyRepository>((ref) {
  return PrivacyPolicyRepository(ref.watch(privacyPolicyApiProvider));
});

final privacyPolicyNotifierProvider =
    StateNotifierProvider<PrivacyPolicyNotifier, PrivacyPolicyState>((ref) {
  return PrivacyPolicyNotifier(ref.watch(privacyPolicyRepositoryProvider));
});
