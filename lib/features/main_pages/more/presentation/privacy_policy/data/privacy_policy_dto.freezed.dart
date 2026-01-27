// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacyPolicyDto {
  int get status;
  String get message;
  @JsonKey(name: 'Data')
  String get data;

  /// Create a copy of PrivacyPolicyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacyPolicyDtoCopyWith<PrivacyPolicyDto> get copyWith =>
      _$PrivacyPolicyDtoCopyWithImpl<PrivacyPolicyDto>(
          this as PrivacyPolicyDto, _$identity);

  /// Serializes this PrivacyPolicyDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyPolicyDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @override
  String toString() {
    return 'PrivacyPolicyDto(status: $status, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $PrivacyPolicyDtoCopyWith<$Res> {
  factory $PrivacyPolicyDtoCopyWith(
          PrivacyPolicyDto value, $Res Function(PrivacyPolicyDto) _then) =
      _$PrivacyPolicyDtoCopyWithImpl;
  @useResult
  $Res call({int status, String message, @JsonKey(name: 'Data') String data});
}

/// @nodoc
class _$PrivacyPolicyDtoCopyWithImpl<$Res>
    implements $PrivacyPolicyDtoCopyWith<$Res> {
  _$PrivacyPolicyDtoCopyWithImpl(this._self, this._then);

  final PrivacyPolicyDto _self;
  final $Res Function(PrivacyPolicyDto) _then;

  /// Create a copy of PrivacyPolicyDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PrivacyPolicyDto].
extension PrivacyPolicyDtoPatterns on PrivacyPolicyDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PrivacyPolicyDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PrivacyPolicyDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PrivacyPolicyDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int status, String message, @JsonKey(name: 'Data') String data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto() when $default != null:
        return $default(_that.status, _that.message, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int status, String message, @JsonKey(name: 'Data') String data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto():
        return $default(_that.status, _that.message, _that.data);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int status, String message, @JsonKey(name: 'Data') String data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDto() when $default != null:
        return $default(_that.status, _that.message, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PrivacyPolicyDto implements PrivacyPolicyDto {
  const _PrivacyPolicyDto(
      {required this.status,
      required this.message,
      @JsonKey(name: 'Data') required this.data});
  factory _PrivacyPolicyDto.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyDtoFromJson(json);

  @override
  final int status;
  @override
  final String message;
  @override
  @JsonKey(name: 'Data')
  final String data;

  /// Create a copy of PrivacyPolicyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrivacyPolicyDtoCopyWith<_PrivacyPolicyDto> get copyWith =>
      __$PrivacyPolicyDtoCopyWithImpl<_PrivacyPolicyDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrivacyPolicyDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrivacyPolicyDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @override
  String toString() {
    return 'PrivacyPolicyDto(status: $status, message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$PrivacyPolicyDtoCopyWith<$Res>
    implements $PrivacyPolicyDtoCopyWith<$Res> {
  factory _$PrivacyPolicyDtoCopyWith(
          _PrivacyPolicyDto value, $Res Function(_PrivacyPolicyDto) _then) =
      __$PrivacyPolicyDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int status, String message, @JsonKey(name: 'Data') String data});
}

/// @nodoc
class __$PrivacyPolicyDtoCopyWithImpl<$Res>
    implements _$PrivacyPolicyDtoCopyWith<$Res> {
  __$PrivacyPolicyDtoCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyDto _self;
  final $Res Function(_PrivacyPolicyDto) _then;

  /// Create a copy of PrivacyPolicyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_PrivacyPolicyDto(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
