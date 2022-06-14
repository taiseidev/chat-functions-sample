// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveModel _$$_ReceiveModelFromJson(Map<String, dynamic> json) =>
    _$_ReceiveModel(
      name: json['name'] as String,
      deveiceToken: json['deveiceToken'] as String,
      isChatted: json['isChatted'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ReceiveModelToJson(_$_ReceiveModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deveiceToken': instance.deveiceToken,
      'isChatted': instance.isChatted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
