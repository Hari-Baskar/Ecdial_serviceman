import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_state.freezed.dart';

@freezed
class PrivacyPolicyState with _$PrivacyPolicyState {
  const factory PrivacyPolicyState.loading() = _Loading;
  const factory PrivacyPolicyState.data(String html) = _Data;
  const factory PrivacyPolicyState.error(String message) = _Error;
}
