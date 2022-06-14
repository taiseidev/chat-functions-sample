// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveModel _$$_ReceiveModelFromJson(Map<String, dynamic> json) =>
    _$_ReceiveModel(
      name: json['name'] as String,
      deviceToken: json['deviceToken'] as String,
      isChatted: json['isChatted'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ReceiveModelToJson(_$_ReceiveModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deviceToken': instance.deviceToken,
      'isChatted': instance.isChatted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
