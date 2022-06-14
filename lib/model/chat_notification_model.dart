import 'package:chat_functions_app/model/json_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chat_notification_model.freezed.dart';
part 'chat_notification_model.g.dart';

@freezed
class ChatNotificationModel with _$ChatNotificationModel {
  const factory ChatNotificationModel({
    required String name,
    required String deviceToken,
    required bool isChatted,
    @TimestampDateTimeConverter() DateTime? createdAt,
    @TimestampDateTimeConverter() DateTime? updatedAt,
    @TimestampDateTimeConverter() DateTime? deletedAt,
  }) = _ChatNotificationModel;

  factory ChatNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatNotificationModelFromJson(json);
}
