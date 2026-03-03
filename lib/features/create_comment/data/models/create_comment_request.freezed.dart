// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCommentRequest {

 int get taskId; String get content; int? get replyId;
/// Create a copy of CreateCommentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCommentRequestCopyWith<CreateCommentRequest> get copyWith => _$CreateCommentRequestCopyWithImpl<CreateCommentRequest>(this as CreateCommentRequest, _$identity);

  /// Serializes this CreateCommentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCommentRequest&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.content, content) || other.content == content)&&(identical(other.replyId, replyId) || other.replyId == replyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,content,replyId);

@override
String toString() {
  return 'CreateCommentRequest(taskId: $taskId, content: $content, replyId: $replyId)';
}


}

/// @nodoc
abstract mixin class $CreateCommentRequestCopyWith<$Res>  {
  factory $CreateCommentRequestCopyWith(CreateCommentRequest value, $Res Function(CreateCommentRequest) _then) = _$CreateCommentRequestCopyWithImpl;
@useResult
$Res call({
 int taskId, String content, int? replyId
});




}
/// @nodoc
class _$CreateCommentRequestCopyWithImpl<$Res>
    implements $CreateCommentRequestCopyWith<$Res> {
  _$CreateCommentRequestCopyWithImpl(this._self, this._then);

  final CreateCommentRequest _self;
  final $Res Function(CreateCommentRequest) _then;

/// Create a copy of CreateCommentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? content = null,Object? replyId = freezed,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,replyId: freezed == replyId ? _self.replyId : replyId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCommentRequest].
extension CreateCommentRequestPatterns on CreateCommentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCommentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCommentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCommentRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCommentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCommentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCommentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int taskId,  String content,  int? replyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCommentRequest() when $default != null:
return $default(_that.taskId,_that.content,_that.replyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int taskId,  String content,  int? replyId)  $default,) {final _that = this;
switch (_that) {
case _CreateCommentRequest():
return $default(_that.taskId,_that.content,_that.replyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int taskId,  String content,  int? replyId)?  $default,) {final _that = this;
switch (_that) {
case _CreateCommentRequest() when $default != null:
return $default(_that.taskId,_that.content,_that.replyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCommentRequest implements CreateCommentRequest {
  const _CreateCommentRequest({required this.taskId, required this.content, this.replyId});
  factory _CreateCommentRequest.fromJson(Map<String, dynamic> json) => _$CreateCommentRequestFromJson(json);

@override final  int taskId;
@override final  String content;
@override final  int? replyId;

/// Create a copy of CreateCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCommentRequestCopyWith<_CreateCommentRequest> get copyWith => __$CreateCommentRequestCopyWithImpl<_CreateCommentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCommentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCommentRequest&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.content, content) || other.content == content)&&(identical(other.replyId, replyId) || other.replyId == replyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,content,replyId);

@override
String toString() {
  return 'CreateCommentRequest(taskId: $taskId, content: $content, replyId: $replyId)';
}


}

/// @nodoc
abstract mixin class _$CreateCommentRequestCopyWith<$Res> implements $CreateCommentRequestCopyWith<$Res> {
  factory _$CreateCommentRequestCopyWith(_CreateCommentRequest value, $Res Function(_CreateCommentRequest) _then) = __$CreateCommentRequestCopyWithImpl;
@override @useResult
$Res call({
 int taskId, String content, int? replyId
});




}
/// @nodoc
class __$CreateCommentRequestCopyWithImpl<$Res>
    implements _$CreateCommentRequestCopyWith<$Res> {
  __$CreateCommentRequestCopyWithImpl(this._self, this._then);

  final _CreateCommentRequest _self;
  final $Res Function(_CreateCommentRequest) _then;

/// Create a copy of CreateCommentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? content = null,Object? replyId = freezed,}) {
  return _then(_CreateCommentRequest(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,replyId: freezed == replyId ? _self.replyId : replyId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
