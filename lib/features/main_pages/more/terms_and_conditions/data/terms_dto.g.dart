// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TermsDto _$TermsDtoFromJson(Map<String, dynamic> json) => _TermsDto(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      html: json['Data'] as String,
    );

Map<String, dynamic> _$TermsDtoToJson(_TermsDto instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Data': instance.html,
    };
