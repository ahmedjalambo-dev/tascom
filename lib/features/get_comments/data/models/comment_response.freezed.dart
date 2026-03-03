// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetCommentsResponse {

 bool? get success; List<CommentModel>? get data;
/// Create a copy of GetCommentsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCommentsResponseCopyWith<GetCommentsResponse> get copyWith => _$GetCommentsResponseCopyWithImpl<GetCommentsResponse>(this as GetCommentsResponse, _$identity);

  /// Serializes this GetCommentsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCommentsResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetCommentsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetCommentsResponseCopyWith<$Res>  {
  factory $GetCommentsResponseCopyWith(GetCommentsResponse value, $Res Function(GetCommentsResponse) _then) = _$GetCommentsResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, List<CommentModel>? data
});




}
/// @nodoc
class _$GetCommentsResponseCopyWithImpl<$Res>
    implements $GetCommentsResponseCopyWith<$Res> {
  _$GetCommentsResponseCopyWithImpl(this._self, this._then);

  final GetCommentsResponse _self;
  final $Res Function(GetCommentsResponse) _then;

/// Create a copy of GetCommentsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CommentModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetCommentsResponse].
extension GetCommentsResponsePatterns on GetCommentsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCommentsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCommentsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCommentsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetCommentsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCommentsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetCommentsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  List<CommentModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCommentsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  List<CommentModel>? data)  $default,) {final _that = this;
switch (_that) {
case _GetCommentsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  List<CommentModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _GetCommentsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetCommentsResponse implements GetCommentsResponse {
  const _GetCommentsResponse({this.success, final  List<CommentModel>? data}): _data = data;
  factory _GetCommentsResponse.fromJson(Map<String, dynamic> json) => _$GetCommentsResponseFromJson(json);

@override final  bool? success;
 final  List<CommentModel>? _data;
@override List<CommentModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetCommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCommentsResponseCopyWith<_GetCommentsResponse> get copyWith => __$GetCommentsResponseCopyWithImpl<_GetCommentsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetCommentsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCommentsResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetCommentsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetCommentsResponseCopyWith<$Res> implements $GetCommentsResponseCopyWith<$Res> {
  factory _$GetCommentsResponseCopyWith(_GetCommentsResponse value, $Res Function(_GetCommentsResponse) _then) = __$GetCommentsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, List<CommentModel>? data
});




}
/// @nodoc
class __$GetCommentsResponseCopyWithImpl<$Res>
    implements _$GetCommentsResponseCopyWith<$Res> {
  __$GetCommentsResponseCopyWithImpl(this._self, this._then);

  final _GetCommentsResponse _self;
  final $Res Function(_GetCommentsResponse) _then;

/// Create a copy of GetCommentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_GetCommentsResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CommentModel>?,
  ));
}


}


/// @nodoc
mixin _$CommentModel {

 String? get id; String? get taskId; String? get userId; String? get content; String? get replyId; String? get createdAt; String? get updatedAt; String? get status; CommentUserModel? get user; List<CommentModel> get replies;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.replyId, replyId) || other.replyId == replyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.replies, replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,content,replyId,createdAt,updatedAt,status,user,const DeepCollectionEquality().hash(replies));

@override
String toString() {
  return 'CommentModel(id: $id, taskId: $taskId, userId: $userId, content: $content, replyId: $replyId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, user: $user, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? taskId, String? userId, String? content, String? replyId, String? createdAt, String? updatedAt, String? status, CommentUserModel? user, List<CommentModel> replies
});


$CommentUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? taskId = freezed,Object? userId = freezed,Object? content = freezed,Object? replyId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? status = freezed,Object? user = freezed,Object? replies = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,replyId: freezed == replyId ? _self.replyId : replyId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUserModel?,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,
  ));
}
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $CommentUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommentModel].
extension CommentModelPatterns on CommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? taskId,  String? userId,  String? content,  String? replyId,  String? createdAt,  String? updatedAt,  String? status,  CommentUserModel? user,  List<CommentModel> replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.replyId,_that.createdAt,_that.updatedAt,_that.status,_that.user,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? taskId,  String? userId,  String? content,  String? replyId,  String? createdAt,  String? updatedAt,  String? status,  CommentUserModel? user,  List<CommentModel> replies)  $default,) {final _that = this;
switch (_that) {
case _CommentModel():
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.replyId,_that.createdAt,_that.updatedAt,_that.status,_that.user,_that.replies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? taskId,  String? userId,  String? content,  String? replyId,  String? createdAt,  String? updatedAt,  String? status,  CommentUserModel? user,  List<CommentModel> replies)?  $default,) {final _that = this;
switch (_that) {
case _CommentModel() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.replyId,_that.createdAt,_that.updatedAt,_that.status,_that.user,_that.replies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentModel implements CommentModel {
  const _CommentModel({this.id, this.taskId, this.userId, this.content, this.replyId, this.createdAt, this.updatedAt, this.status, this.user, final  List<CommentModel> replies = const []}): _replies = replies;
  factory _CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

@override final  String? id;
@override final  String? taskId;
@override final  String? userId;
@override final  String? content;
@override final  String? replyId;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? status;
@override final  CommentUserModel? user;
 final  List<CommentModel> _replies;
@override@JsonKey() List<CommentModel> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.replyId, replyId) || other.replyId == replyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._replies, _replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,content,replyId,createdAt,updatedAt,status,user,const DeepCollectionEquality().hash(_replies));

@override
String toString() {
  return 'CommentModel(id: $id, taskId: $taskId, userId: $userId, content: $content, replyId: $replyId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, user: $user, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? taskId, String? userId, String? content, String? replyId, String? createdAt, String? updatedAt, String? status, CommentUserModel? user, List<CommentModel> replies
});


@override $CommentUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? taskId = freezed,Object? userId = freezed,Object? content = freezed,Object? replyId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? status = freezed,Object? user = freezed,Object? replies = null,}) {
  return _then(_CommentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,replyId: freezed == replyId ? _self.replyId : replyId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CommentUserModel?,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,
  ));
}

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $CommentUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$CommentUserModel {

 String? get id; String? get name; String? get avatar;
/// Create a copy of CommentUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentUserModelCopyWith<CommentUserModel> get copyWith => _$CommentUserModelCopyWithImpl<CommentUserModel>(this as CommentUserModel, _$identity);

  /// Serializes this CommentUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'CommentUserModel(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $CommentUserModelCopyWith<$Res>  {
  factory $CommentUserModelCopyWith(CommentUserModel value, $Res Function(CommentUserModel) _then) = _$CommentUserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? avatar
});




}
/// @nodoc
class _$CommentUserModelCopyWithImpl<$Res>
    implements $CommentUserModelCopyWith<$Res> {
  _$CommentUserModelCopyWithImpl(this._self, this._then);

  final CommentUserModel _self;
  final $Res Function(CommentUserModel) _then;

/// Create a copy of CommentUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentUserModel].
extension CommentUserModelPatterns on CommentUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentUserModel value)  $default,){
final _that = this;
switch (_that) {
case _CommentUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommentUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentUserModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? avatar)  $default,) {final _that = this;
switch (_that) {
case _CommentUserModel():
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? avatar)?  $default,) {final _that = this;
switch (_that) {
case _CommentUserModel() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentUserModel implements CommentUserModel {
  const _CommentUserModel({this.id, this.name, this.avatar});
  factory _CommentUserModel.fromJson(Map<String, dynamic> json) => _$CommentUserModelFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? avatar;

/// Create a copy of CommentUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentUserModelCopyWith<_CommentUserModel> get copyWith => __$CommentUserModelCopyWithImpl<_CommentUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'CommentUserModel(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$CommentUserModelCopyWith<$Res> implements $CommentUserModelCopyWith<$Res> {
  factory _$CommentUserModelCopyWith(_CommentUserModel value, $Res Function(_CommentUserModel) _then) = __$CommentUserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? avatar
});




}
/// @nodoc
class __$CommentUserModelCopyWithImpl<$Res>
    implements _$CommentUserModelCopyWith<$Res> {
  __$CommentUserModelCopyWithImpl(this._self, this._then);

  final _CommentUserModel _self;
  final $Res Function(_CommentUserModel) _then;

/// Create a copy of CommentUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? avatar = freezed,}) {
  return _then(_CommentUserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
