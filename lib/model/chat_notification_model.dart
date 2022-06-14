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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ChatNotificationModel;

  factory ChatNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatNotificationModelFromJson(json);
}
