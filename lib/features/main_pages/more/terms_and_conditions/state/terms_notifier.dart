import 'package:flutter_riverpod/legacy.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/data/terms_repository.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/state/terms_state.dart';

class TermsNotifier extends StateNotifier<TermsState> {
  final TermsRepository termsRepository;
  TermsNotifier(this.termsRepository) : super(TermsState.loading());

  Future<void> fetchTerms() async {
    try {
      state = const TermsState.loading();
      final terms = await termsRepository.getTermsHtml();
      state = TermsState.data(terms);
    } catch (e) {
      state = TermsState.error(e.toString());
    }
  }
}
