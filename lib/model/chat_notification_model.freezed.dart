// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatNotificationModel _$ChatNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _ChatNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$ChatNotificationModel {
  String get name => throw _privateConstructorUsedError;
  String get deviceToken => throw _privateConstructorUsedError;
  bool get isChatted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatNotificationModelCopyWith<ChatNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatNotificationModelCopyWith<$Res> {
  factory $ChatNotificationModelCopyWith(ChatNotificationModel value,
          $Res Function(ChatNotificationModel) then) =
      _$ChatNotificationModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String deviceToken,
      bool isChatted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ChatNotificationModelCopyWithImpl<$Res>
    implements $ChatNotificationModelCopyWith<$Res> {
  _$ChatNotificationModelCopyWithImpl(this._value, this._then);

  final ChatNotificationModel _value;
  // ignore: unused_field
  final $Res Function(ChatNotificationModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? deviceToken = freezed,
    Object? isChatted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: deviceToken == freezed
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChatted: isChatted == freezed
          ? _value.isChatted
          : isChatted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatNotificationModelCopyWith<$Res>
    implements $ChatNotificationModelCopyWith<$Res> {
  factory _$$_ChatNotificationModelCopyWith(_$_ChatNotificationModel value,
          $Res Function(_$_ChatNotificationModel) then) =
      __$$_ChatNotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String deviceToken,
      bool isChatted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_ChatNotificationModelCopyWithImpl<$Res>
    extends _$ChatNotificationModelCopyWithImpl<$Res>
    implements _$$_ChatNotificationModelCopyWith<$Res> {
  __$$_ChatNotificationModelCopyWithImpl(_$_ChatNotificationModel _value,
      $Res Function(_$_ChatNotificationModel) _then)
      : super(_value, (v) => _then(v as _$_ChatNotificationModel));

  @override
  _$_ChatNotificationModel get _value =>
      super._value as _$_ChatNotificationModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? deviceToken = freezed,
    Object? isChatted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ChatNotificationModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deviceToken: deviceToken == freezed
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChatted: isChatted == freezed
          ? _value.isChatted
          : isChatted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatNotificationModel
    with DiagnosticableTreeMixin
    implements _ChatNotificationModel {
  const _$_ChatNotificationModel(
      {required this.name,
      required this.deviceToken,
      required this.isChatted,
      this.createdAt,
      this.updatedAt});

  factory _$_ChatNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatNotificationModelFromJson(json);

  @override
  final String name;
  @override
  final String deviceToken;
  @override
  final bool isChatted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatNotificationModel(name: $name, deviceToken: $deviceToken, isChatted: $isChatted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatNotificationModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('deviceToken', deviceToken))
      ..add(DiagnosticsProperty('isChatted', isChatted))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatNotificationModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.deviceToken, deviceToken) &&
            const DeepCollectionEquality().equals(other.isChatted, isChatted) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(deviceToken),
      const DeepCollectionEquality().hash(isChatted),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ChatNotificationModelCopyWith<_$_ChatNotificationModel> get copyWith =>
      __$$_ChatNotificationModelCopyWithImpl<_$_ChatNotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatNotificationModelToJson(this);
  }
}

abstract class _ChatNotificationModel implements ChatNotificationModel {
  const factory _ChatNotificationModel(
      {required final String name,
      required final String deviceToken,
      required final bool isChatted,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_ChatNotificationModel;

  factory _ChatNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_ChatNotificationModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get deviceToken => throw _privateConstructorUsedError;
  @override
  bool get isChatted => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ChatNotificationModelCopyWith<_$_ChatNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
