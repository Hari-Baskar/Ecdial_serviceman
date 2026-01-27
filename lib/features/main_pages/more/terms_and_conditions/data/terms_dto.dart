import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_dto.freezed.dart';
part 'terms_dto.g.dart';

@freezed
abstract class TermsDto with _$TermsDto {
  const factory TermsDto({
    required int status,
    required String message,
    @JsonKey(name: 'Data') required String html,
  }) = _TermsDto;

  factory TermsDto.fromJson(Map<String, dynamic> json) =>
      _$TermsDtoFromJson(json);
}
