// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCommentResponse {

 bool? get success; CommentModel? get data;
/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCommentResponseCopyWith<CreateCommentResponse> get copyWith => _$CreateCommentResponseCopyWithImpl<CreateCommentResponse>(this as CreateCommentResponse, _$identity);

  /// Serializes this CreateCommentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCommentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'CreateCommentResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateCommentResponseCopyWith<$Res>  {
  factory $CreateCommentResponseCopyWith(CreateCommentResponse value, $Res Function(CreateCommentResponse) _then) = _$CreateCommentResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, CommentModel? data
});


$CommentModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$CreateCommentResponseCopyWithImpl<$Res>
    implements $CreateCommentResponseCopyWith<$Res> {
  _$CreateCommentResponseCopyWithImpl(this._self, this._then);

  final CreateCommentResponse _self;
  final $Res Function(CreateCommentResponse) _then;

/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CommentModel?,
  ));
}
/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CommentModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateCommentResponse].
extension CreateCommentResponsePatterns on CreateCommentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCommentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCommentResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCommentResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateCommentResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCommentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCommentResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  CommentModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCommentResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  CommentModel? data)  $default,) {final _that = this;
switch (_that) {
case _CreateCommentResponse():
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  CommentModel? data)?  $default,) {final _that = this;
switch (_that) {
case _CreateCommentResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCommentResponse implements CreateCommentResponse {
  const _CreateCommentResponse({this.success, this.data});
  factory _CreateCommentResponse.fromJson(Map<String, dynamic> json) => _$CreateCommentResponseFromJson(json);

@override final  bool? success;
@override final  CommentModel? data;

/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCommentResponseCopyWith<_CreateCommentResponse> get copyWith => __$CreateCommentResponseCopyWithImpl<_CreateCommentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCommentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCommentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'CreateCommentResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateCommentResponseCopyWith<$Res> implements $CreateCommentResponseCopyWith<$Res> {
  factory _$CreateCommentResponseCopyWith(_CreateCommentResponse value, $Res Function(_CreateCommentResponse) _then) = __$CreateCommentResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, CommentModel? data
});


@override $CommentModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$CreateCommentResponseCopyWithImpl<$Res>
    implements _$CreateCommentResponseCopyWith<$Res> {
  __$CreateCommentResponseCopyWithImpl(this._self, this._then);

  final _CreateCommentResponse _self;
  final $Res Function(_CreateCommentResponse) _then;

/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_CreateCommentResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CommentModel?,
  ));
}

/// Create a copy of CreateCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CommentModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
