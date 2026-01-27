// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TermsDto {
  int get status;
  String get message;
  @JsonKey(name: 'Data')
  String get html;

  /// Create a copy of TermsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TermsDtoCopyWith<TermsDto> get copyWith =>
      _$TermsDtoCopyWithImpl<TermsDto>(this as TermsDto, _$identity);

  /// Serializes this TermsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TermsDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.html, html) || other.html == html));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, html);

  @override
  String toString() {
    return 'TermsDto(status: $status, message: $message, html: $html)';
  }
}

/// @nodoc
abstract mixin class $TermsDtoCopyWith<$Res> {
  factory $TermsDtoCopyWith(TermsDto value, $Res Function(TermsDto) _then) =
      _$TermsDtoCopyWithImpl;
  @useResult
  $Res call({int status, String message, @JsonKey(name: 'Data') String html});
}

/// @nodoc
class _$TermsDtoCopyWithImpl<$Res> implements $TermsDtoCopyWith<$Res> {
  _$TermsDtoCopyWithImpl(this._self, this._then);

  final TermsDto _self;
  final $Res Function(TermsDto) _then;

  /// Create a copy of TermsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? html = null,
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
      html: null == html
          ? _self.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TermsDto].
extension TermsDtoPatterns on TermsDto {
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
    TResult Function(_TermsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TermsDto() when $default != null:
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
    TResult Function(_TermsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsDto():
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
    TResult? Function(_TermsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsDto() when $default != null:
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
            int status, String message, @JsonKey(name: 'Data') String html)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TermsDto() when $default != null:
        return $default(_that.status, _that.message, _that.html);
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
            int status, String message, @JsonKey(name: 'Data') String html)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsDto():
        return $default(_that.status, _that.message, _that.html);
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
            int status, String message, @JsonKey(name: 'Data') String html)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsDto() when $default != null:
        return $default(_that.status, _that.message, _that.html);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TermsDto implements TermsDto {
  const _TermsDto(
      {required this.status,
      required this.message,
      @JsonKey(name: 'Data') required this.html});
  factory _TermsDto.fromJson(Map<String, dynamic> json) =>
      _$TermsDtoFromJson(json);

  @override
  final int status;
  @override
  final String message;
  @override
  @JsonKey(name: 'Data')
  final String html;

  /// Create a copy of TermsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TermsDtoCopyWith<_TermsDto> get copyWith =>
      __$TermsDtoCopyWithImpl<_TermsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TermsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TermsDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.html, html) || other.html == html));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, html);

  @override
  String toString() {
    return 'TermsDto(status: $status, message: $message, html: $html)';
  }
}

/// @nodoc
abstract mixin class _$TermsDtoCopyWith<$Res>
    implements $TermsDtoCopyWith<$Res> {
  factory _$TermsDtoCopyWith(_TermsDto value, $Res Function(_TermsDto) _then) =
      __$TermsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int status, String message, @JsonKey(name: 'Data') String html});
}

/// @nodoc
class __$TermsDtoCopyWithImpl<$Res> implements _$TermsDtoCopyWith<$Res> {
  __$TermsDtoCopyWithImpl(this._self, this._then);

  final _TermsDto _self;
  final $Res Function(_TermsDto) _then;

  /// Create a copy of TermsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? html = null,
  }) {
    return _then(_TermsDto(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      html: null == html
          ? _self.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
