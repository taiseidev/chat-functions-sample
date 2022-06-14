// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiveModel _$ReceiveModelFromJson(Map<String, dynamic> json) {
  return _ReceiveModel.fromJson(json);
}

/// @nodoc
mixin _$ReceiveModel {
  String get name => throw _privateConstructorUsedError;
  String get deveiceToken => throw _privateConstructorUsedError;
  bool get isChatted => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiveModelCopyWith<ReceiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveModelCopyWith<$Res> {
  factory $ReceiveModelCopyWith(
          ReceiveModel value, $Res Function(ReceiveModel) then) =
      _$ReceiveModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String deveiceToken,
      bool isChatted,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ReceiveModelCopyWithImpl<$Res> implements $ReceiveModelCopyWith<$Res> {
  _$ReceiveModelCopyWithImpl(this._value, this._then);

  final ReceiveModel _value;
  // ignore: unused_field
  final $Res Function(ReceiveModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? deveiceToken = freezed,
    Object? isChatted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deveiceToken: deveiceToken == freezed
          ? _value.deveiceToken
          : deveiceToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChatted: isChatted == freezed
          ? _value.isChatted
          : isChatted // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_ReceiveModelCopyWith<$Res>
    implements $ReceiveModelCopyWith<$Res> {
  factory _$$_ReceiveModelCopyWith(
          _$_ReceiveModel value, $Res Function(_$_ReceiveModel) then) =
      __$$_ReceiveModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String deveiceToken,
      bool isChatted,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_ReceiveModelCopyWithImpl<$Res>
    extends _$ReceiveModelCopyWithImpl<$Res>
    implements _$$_ReceiveModelCopyWith<$Res> {
  __$$_ReceiveModelCopyWithImpl(
      _$_ReceiveModel _value, $Res Function(_$_ReceiveModel) _then)
      : super(_value, (v) => _then(v as _$_ReceiveModel));

  @override
  _$_ReceiveModel get _value => super._value as _$_ReceiveModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? deveiceToken = freezed,
    Object? isChatted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ReceiveModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deveiceToken: deveiceToken == freezed
          ? _value.deveiceToken
          : deveiceToken // ignore: cast_nullable_to_non_nullable
              as String,
      isChatted: isChatted == freezed
          ? _value.isChatted
          : isChatted // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$_ReceiveModel with DiagnosticableTreeMixin implements _ReceiveModel {
  const _$_ReceiveModel(
      {required this.name,
      required this.deveiceToken,
      required this.isChatted,
      required this.createdAt,
      required this.updatedAt});

  factory _$_ReceiveModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiveModelFromJson(json);

  @override
  final String name;
  @override
  final String deveiceToken;
  @override
  final bool isChatted;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiveModel(name: $name, deveiceToken: $deveiceToken, isChatted: $isChatted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReceiveModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('deveiceToken', deveiceToken))
      ..add(DiagnosticsProperty('isChatted', isChatted))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiveModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.deveiceToken, deveiceToken) &&
            const DeepCollectionEquality().equals(other.isChatted, isChatted) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(deveiceToken),
      const DeepCollectionEquality().hash(isChatted),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ReceiveModelCopyWith<_$_ReceiveModel> get copyWith =>
      __$$_ReceiveModelCopyWithImpl<_$_ReceiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiveModelToJson(this);
  }
}

abstract class _ReceiveModel implements ReceiveModel {
  const factory _ReceiveModel(
      {required final String name,
      required final String deveiceToken,
      required final bool isChatted,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_ReceiveModel;

  factory _ReceiveModel.fromJson(Map<String, dynamic> json) =
      _$_ReceiveModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get deveiceToken => throw _privateConstructorUsedError;
  @override
  bool get isChatted => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiveModelCopyWith<_$_ReceiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
