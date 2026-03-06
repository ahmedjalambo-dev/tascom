// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditCommentRequest {

 String get content;
/// Create a copy of EditCommentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditCommentRequestCopyWith<EditCommentRequest> get copyWith => _$EditCommentRequestCopyWithImpl<EditCommentRequest>(this as EditCommentRequest, _$identity);

  /// Serializes this EditCommentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditCommentRequest&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'EditCommentRequest(content: $content)';
}


}

/// @nodoc
abstract mixin class $EditCommentRequestCopyWith<$Res>  {
  factory $EditCommentRequestCopyWith(EditCommentRequest value, $Res Function(EditCommentRequest) _then) = _$EditCommentRequestCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$EditCommentRequestCopyWithImpl<$Res>
    implements $EditCommentRequestCopyWith<$Res> {
  _$EditCommentRequestCopyWithImpl(this._self, this._then);

  final EditCommentRequest _self;
  final $Res Function(EditCommentRequest) _then;

/// Create a copy of EditCommentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EditCommentRequest].
extension EditCommentRequestPatterns on EditCommentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditCommentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditCommentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditCommentRequest value)  $default,){
final _that = this;
switch (_that) {
case _EditCommentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditCommentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EditCommentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditCommentRequest() when $default != null:
return $default(_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content)  $default,) {final _that = this;
switch (_that) {
case _EditCommentRequest():
return $default(_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content)?  $default,) {final _that = this;
switch (_that) {
case _EditCommentRequest() when $default != null:
return $default(_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditCommentRequest implements EditCommentRequest {
  const _EditCommentRequest({required this.content});
  factory _EditCommentRequest.fromJson(Map<String, dynamic> json) => _$EditCommentRequestFromJson(json);

@override final  String content;

/// Create a copy of EditCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditCommentRequestCopyWith<_EditCommentRequest> get copyWith => __$EditCommentRequestCopyWithImpl<_EditCommentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditCommentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditCommentRequest&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'EditCommentRequest(content: $content)';
}


}

/// @nodoc
abstract mixin class _$EditCommentRequestCopyWith<$Res> implements $EditCommentRequestCopyWith<$Res> {
  factory _$EditCommentRequestCopyWith(_EditCommentRequest value, $Res Function(_EditCommentRequest) _then) = __$EditCommentRequestCopyWithImpl;
@override @useResult
$Res call({
 String content
});




}
/// @nodoc
class __$EditCommentRequestCopyWithImpl<$Res>
    implements _$EditCommentRequestCopyWith<$Res> {
  __$EditCommentRequestCopyWithImpl(this._self, this._then);

  final _EditCommentRequest _self;
  final $Res Function(_EditCommentRequest) _then;

/// Create a copy of EditCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_EditCommentRequest(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
