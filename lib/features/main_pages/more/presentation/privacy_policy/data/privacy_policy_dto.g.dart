// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacyPolicyDto _$PrivacyPolicyDtoFromJson(Map<String, dynamic> json) =>
    _PrivacyPolicyDto(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: json['Data'] as String,
    );

Map<String, dynamic> _$PrivacyPolicyDtoToJson(_PrivacyPolicyDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Data': instance.data,
    };
