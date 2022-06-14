import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'receive_model.freezed.dart';
part 'receive_model.g.dart';

@freezed
class ReceiveModel with _$ReceiveModel {
  const factory ReceiveModel({
    required String name,
    required String deveiceToken,
    required bool isChatted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReceiveModel;

  factory ReceiveModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiveModelFromJson(json);
}
