import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_state.freezed.dart';

@freezed
class TermsState with _$TermsState {
  const factory TermsState.loading() = _Loading;
  const factory TermsState.data(String html) = _Data;
  const factory TermsState.error(String message) = _Error;
}
