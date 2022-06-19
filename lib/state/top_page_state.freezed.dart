// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopPageState {
  UserModel? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDisplayDialog => throw _privateConstructorUsedError;
  bool get isRegister => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopPageStateCopyWith<TopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopPageStateCopyWith<$Res> {
  factory $TopPageStateCopyWith(
          TopPageState value, $Res Function(TopPageState) then) =
      _$TopPageStateCopyWithImpl<$Res>;
  $Res call(
      {UserModel? user,
      bool isLoading,
      bool isDisplayDialog,
      bool isRegister,
      String? errorMessage});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TopPageStateCopyWithImpl<$Res> implements $TopPageStateCopyWith<$Res> {
  _$TopPageStateCopyWithImpl(this._value, this._then);

  final TopPageState _value;
  // ignore: unused_field
  final $Res Function(TopPageState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isDisplayDialog = freezed,
    Object? isRegister = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisplayDialog: isDisplayDialog == freezed
          ? _value.isDisplayDialog
          : isDisplayDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegister: isRegister == freezed
          ? _value.isRegister
          : isRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_TopPageStateCopyWith<$Res>
    implements $TopPageStateCopyWith<$Res> {
  factory _$$_TopPageStateCopyWith(
          _$_TopPageState value, $Res Function(_$_TopPageState) then) =
      __$$_TopPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel? user,
      bool isLoading,
      bool isDisplayDialog,
      bool isRegister,
      String? errorMessage});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_TopPageStateCopyWithImpl<$Res>
    extends _$TopPageStateCopyWithImpl<$Res>
    implements _$$_TopPageStateCopyWith<$Res> {
  __$$_TopPageStateCopyWithImpl(
      _$_TopPageState _value, $Res Function(_$_TopPageState) _then)
      : super(_value, (v) => _then(v as _$_TopPageState));

  @override
  _$_TopPageState get _value => super._value as _$_TopPageState;

  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isDisplayDialog = freezed,
    Object? isRegister = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_TopPageState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisplayDialog: isDisplayDialog == freezed
          ? _value.isDisplayDialog
          : isDisplayDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegister: isRegister == freezed
          ? _value.isRegister
          : isRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TopPageState implements _TopPageState {
  _$_TopPageState(
      {this.user,
      this.isLoading = false,
      this.isDisplayDialog = false,
      this.isRegister = false,
      this.errorMessage = ''});

  @override
  final UserModel? user;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDisplayDialog;
  @override
  @JsonKey()
  final bool isRegister;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'TopPageState(user: $user, isLoading: $isLoading, isDisplayDialog: $isDisplayDialog, isRegister: $isRegister, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopPageState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isDisplayDialog, isDisplayDialog) &&
            const DeepCollectionEquality()
                .equals(other.isRegister, isRegister) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isDisplayDialog),
      const DeepCollectionEquality().hash(isRegister),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      __$$_TopPageStateCopyWithImpl<_$_TopPageState>(this, _$identity);
}

abstract class _TopPageState implements TopPageState {
  factory _TopPageState(
      {final UserModel? user,
      final bool isLoading,
      final bool isDisplayDialog,
      final bool isRegister,
      final String? errorMessage}) = _$_TopPageState;

  @override
  UserModel? get user => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isDisplayDialog => throw _privateConstructorUsedError;
  @override
  bool get isRegister => throw _privateConstructorUsedError;
  @override
  String? get errorMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TopPageStateCopyWith<_$_TopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
