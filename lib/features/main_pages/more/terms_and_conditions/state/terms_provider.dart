import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/data/terms_api.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/data/terms_repository.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/state/terms_notifier.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/state/terms_state.dart';

final termsApiProvider = Provider<TermsApi>((ref) {
  return TermsApi();
});

final termsRepositoryProvider = Provider<TermsRepository>((ref) {
  return TermsRepository(ref.watch(termsApiProvider));
});

final termsNotifierProvider =
    StateNotifierProvider<TermsNotifier, TermsState>((ref) {
  return TermsNotifier(ref.watch(termsRepositoryProvider));
});
