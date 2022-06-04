// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserChatModel _$UserChatModelFromJson(Map<String, dynamic> json) {
  return _UserChatModel.fromJson(json);
}

/// @nodoc
mixin _$UserChatModel {
  String get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  int? get lastSeen => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserChatModelCopyWith<UserChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatModelCopyWith<$Res> {
  factory $UserChatModelCopyWith(
          UserChatModel value, $Res Function(UserChatModel) then) =
      _$UserChatModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? firstName,
      String? imageUrl,
      String? lastName,
      int? lastSeen,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserChatModelCopyWithImpl<$Res>
    implements $UserChatModelCopyWith<$Res> {
  _$UserChatModelCopyWithImpl(this._value, this._then);

  final UserChatModel _value;
  // ignore: unused_field
  final $Res Function(UserChatModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? imageUrl = freezed,
    Object? lastName = freezed,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: lastSeen == freezed
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_UserChatModelCopyWith<$Res>
    implements $UserChatModelCopyWith<$Res> {
  factory _$$_UserChatModelCopyWith(
          _$_UserChatModel value, $Res Function(_$_UserChatModel) then) =
      __$$_UserChatModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? firstName,
      String? imageUrl,
      String? lastName,
      int? lastSeen,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_UserChatModelCopyWithImpl<$Res>
    extends _$UserChatModelCopyWithImpl<$Res>
    implements _$$_UserChatModelCopyWith<$Res> {
  __$$_UserChatModelCopyWithImpl(
      _$_UserChatModel _value, $Res Function(_$_UserChatModel) _then)
      : super(_value, (v) => _then(v as _$_UserChatModel));

  @override
  _$_UserChatModel get _value => super._value as _$_UserChatModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? imageUrl = freezed,
    Object? lastName = freezed,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserChatModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSeen: lastSeen == freezed
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserChatModel with DiagnosticableTreeMixin implements _UserChatModel {
  const _$_UserChatModel(
      {required this.id,
      this.firstName,
      this.imageUrl,
      this.lastName,
      this.lastSeen,
      required this.createdAt,
      required this.updatedAt});

  factory _$_UserChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserChatModelFromJson(json);

  @override
  final String id;
  @override
  final String? firstName;
  @override
  final String? imageUrl;
  @override
  final String? lastName;
  @override
  final int? lastSeen;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserChatModel(id: $id, firstName: $firstName, imageUrl: $imageUrl, lastName: $lastName, lastSeen: $lastSeen, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserChatModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('lastSeen', lastSeen))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserChatModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.lastSeen, lastSeen) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(lastSeen),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_UserChatModelCopyWith<_$_UserChatModel> get copyWith =>
      __$$_UserChatModelCopyWithImpl<_$_UserChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserChatModelToJson(this);
  }
}

abstract class _UserChatModel implements UserChatModel {
  const factory _UserChatModel(
      {required final String id,
      final String? firstName,
      final String? imageUrl,
      final String? lastName,
      final int? lastSeen,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_UserChatModel;

  factory _UserChatModel.fromJson(Map<String, dynamic> json) =
      _$_UserChatModel.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  int? get lastSeen => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserChatModelCopyWith<_$_UserChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
