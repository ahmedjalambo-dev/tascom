// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditCommentResponse {

 bool? get success; CommentModel? get data;
/// Create a copy of EditCommentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditCommentResponseCopyWith<EditCommentResponse> get copyWith => _$EditCommentResponseCopyWithImpl<EditCommentResponse>(this as EditCommentResponse, _$identity);

  /// Serializes this EditCommentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditCommentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'EditCommentResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $EditCommentResponseCopyWith<$Res>  {
  factory $EditCommentResponseCopyWith(EditCommentResponse value, $Res Function(EditCommentResponse) _then) = _$EditCommentResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, CommentModel? data
});


$CommentModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$EditCommentResponseCopyWithImpl<$Res>
    implements $EditCommentResponseCopyWith<$Res> {
  _$EditCommentResponseCopyWithImpl(this._self, this._then);

  final EditCommentResponse _self;
  final $Res Function(EditCommentResponse) _then;

/// Create a copy of EditCommentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CommentModel?,
  ));
}
/// Create a copy of EditCommentResponse
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


/// Adds pattern-matching-related methods to [EditCommentResponse].
extension EditCommentResponsePatterns on EditCommentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditCommentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditCommentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditCommentResponse value)  $default,){
final _that = this;
switch (_that) {
case _EditCommentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditCommentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _EditCommentResponse() when $default != null:
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
case _EditCommentResponse() when $default != null:
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
case _EditCommentResponse():
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
case _EditCommentResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditCommentResponse implements EditCommentResponse {
  const _EditCommentResponse({this.success, this.data});
  factory _EditCommentResponse.fromJson(Map<String, dynamic> json) => _$EditCommentResponseFromJson(json);

@override final  bool? success;
@override final  CommentModel? data;

/// Create a copy of EditCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditCommentResponseCopyWith<_EditCommentResponse> get copyWith => __$EditCommentResponseCopyWithImpl<_EditCommentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditCommentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditCommentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'EditCommentResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$EditCommentResponseCopyWith<$Res> implements $EditCommentResponseCopyWith<$Res> {
  factory _$EditCommentResponseCopyWith(_EditCommentResponse value, $Res Function(_EditCommentResponse) _then) = __$EditCommentResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, CommentModel? data
});


@override $CommentModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$EditCommentResponseCopyWithImpl<$Res>
    implements _$EditCommentResponseCopyWith<$Res> {
  __$EditCommentResponseCopyWithImpl(this._self, this._then);

  final _EditCommentResponse _self;
  final $Res Function(_EditCommentResponse) _then;

/// Create a copy of EditCommentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_EditCommentResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CommentModel?,
  ));
}

/// Create a copy of EditCommentResponse
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
