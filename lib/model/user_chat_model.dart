import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_chat_model.freezed.dart';
part 'user_chat_model.g.dart';

@freezed
class UserChatModel with _$UserChatModel {
  const factory UserChatModel({
    required String id,
    String? firstName,
    String? imageUrl,
    String? lastName,
    int? lastSeen,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserChatModel;

  factory UserChatModel.fromJson(Map<String, dynamic> json) =>
      _$UserChatModelFromJson(json);
}
