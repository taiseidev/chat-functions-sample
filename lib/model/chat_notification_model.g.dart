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
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      deletedAt: const TimestampDateTimeConverter()
          .fromJson(json['deletedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_ChatNotificationModelToJson(
        _$_ChatNotificationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deviceToken': instance.deviceToken,
      'isChatted': instance.isChatted,
      'createdAt':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updatedAt':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'deletedAt':
          const TimestampDateTimeConverter().toJson(instance.deletedAt),
    };
