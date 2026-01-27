import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_dto.freezed.dart';
part 'privacy_policy_dto.g.dart';

@freezed
abstract class PrivacyPolicyDto with _$PrivacyPolicyDto {
  const factory PrivacyPolicyDto({
    required int status,
    required String message,
    @JsonKey(name: 'Data') required String data,
  }) = _PrivacyPolicyDto;

  factory PrivacyPolicyDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyDtoFromJson(json);
}
