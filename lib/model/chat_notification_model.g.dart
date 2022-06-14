// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatNotificationModel _$$_ChatNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ChatNotificationModel(
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

Map<String, dynamic> _$$_ChatNotificationModelToJson(
        _$_ChatNotificationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deviceToken': instance.deviceToken,
      'isChatted': instance.isChatted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
