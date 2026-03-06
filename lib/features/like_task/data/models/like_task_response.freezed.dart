// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikeTaskResponse {

 bool? get success; LikeTaskData? get data;
/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeTaskResponseCopyWith<LikeTaskResponse> get copyWith => _$LikeTaskResponseCopyWithImpl<LikeTaskResponse>(this as LikeTaskResponse, _$identity);

  /// Serializes this LikeTaskResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'LikeTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $LikeTaskResponseCopyWith<$Res>  {
  factory $LikeTaskResponseCopyWith(LikeTaskResponse value, $Res Function(LikeTaskResponse) _then) = _$LikeTaskResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, LikeTaskData? data
});


$LikeTaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LikeTaskResponseCopyWithImpl<$Res>
    implements $LikeTaskResponseCopyWith<$Res> {
  _$LikeTaskResponseCopyWithImpl(this._self, this._then);

  final LikeTaskResponse _self;
  final $Res Function(LikeTaskResponse) _then;

/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LikeTaskData?,
  ));
}
/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikeTaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LikeTaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LikeTaskResponse].
extension LikeTaskResponsePatterns on LikeTaskResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeTaskResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeTaskResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeTaskResponse value)  $default,){
final _that = this;
switch (_that) {
case _LikeTaskResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeTaskResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LikeTaskResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  LikeTaskData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeTaskResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  LikeTaskData? data)  $default,) {final _that = this;
switch (_that) {
case _LikeTaskResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  LikeTaskData? data)?  $default,) {final _that = this;
switch (_that) {
case _LikeTaskResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LikeTaskResponse implements LikeTaskResponse {
  const _LikeTaskResponse({this.success, this.data});
  factory _LikeTaskResponse.fromJson(Map<String, dynamic> json) => _$LikeTaskResponseFromJson(json);

@override final  bool? success;
@override final  LikeTaskData? data;

/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeTaskResponseCopyWith<_LikeTaskResponse> get copyWith => __$LikeTaskResponseCopyWithImpl<_LikeTaskResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikeTaskResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'LikeTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LikeTaskResponseCopyWith<$Res> implements $LikeTaskResponseCopyWith<$Res> {
  factory _$LikeTaskResponseCopyWith(_LikeTaskResponse value, $Res Function(_LikeTaskResponse) _then) = __$LikeTaskResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, LikeTaskData? data
});


@override $LikeTaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LikeTaskResponseCopyWithImpl<$Res>
    implements _$LikeTaskResponseCopyWith<$Res> {
  __$LikeTaskResponseCopyWithImpl(this._self, this._then);

  final _LikeTaskResponse _self;
  final $Res Function(_LikeTaskResponse) _then;

/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_LikeTaskResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LikeTaskData?,
  ));
}

/// Create a copy of LikeTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LikeTaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LikeTaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LikeTaskData {

 String? get id; int? get numOfLikes; List<LikeInfo> get likes;
/// Create a copy of LikeTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeTaskDataCopyWith<LikeTaskData> get copyWith => _$LikeTaskDataCopyWithImpl<LikeTaskData>(this as LikeTaskData, _$identity);

  /// Serializes this LikeTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&const DeepCollectionEquality().equals(other.likes, likes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numOfLikes,const DeepCollectionEquality().hash(likes));

@override
String toString() {
  return 'LikeTaskData(id: $id, numOfLikes: $numOfLikes, likes: $likes)';
}


}

/// @nodoc
abstract mixin class $LikeTaskDataCopyWith<$Res>  {
  factory $LikeTaskDataCopyWith(LikeTaskData value, $Res Function(LikeTaskData) _then) = _$LikeTaskDataCopyWithImpl;
@useResult
$Res call({
 String? id, int? numOfLikes, List<LikeInfo> likes
});




}
/// @nodoc
class _$LikeTaskDataCopyWithImpl<$Res>
    implements $LikeTaskDataCopyWith<$Res> {
  _$LikeTaskDataCopyWithImpl(this._self, this._then);

  final LikeTaskData _self;
  final $Res Function(LikeTaskData) _then;

/// Create a copy of LikeTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numOfLikes = freezed,Object? likes = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as List<LikeInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeTaskData].
extension LikeTaskDataPatterns on LikeTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeTaskData value)  $default,){
final _that = this;
switch (_that) {
case _LikeTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _LikeTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int? numOfLikes,  List<LikeInfo> likes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeTaskData() when $default != null:
return $default(_that.id,_that.numOfLikes,_that.likes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int? numOfLikes,  List<LikeInfo> likes)  $default,) {final _that = this;
switch (_that) {
case _LikeTaskData():
return $default(_that.id,_that.numOfLikes,_that.likes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int? numOfLikes,  List<LikeInfo> likes)?  $default,) {final _that = this;
switch (_that) {
case _LikeTaskData() when $default != null:
return $default(_that.id,_that.numOfLikes,_that.likes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LikeTaskData implements LikeTaskData {
  const _LikeTaskData({this.id, this.numOfLikes, final  List<LikeInfo> likes = const []}): _likes = likes;
  factory _LikeTaskData.fromJson(Map<String, dynamic> json) => _$LikeTaskDataFromJson(json);

@override final  String? id;
@override final  int? numOfLikes;
 final  List<LikeInfo> _likes;
@override@JsonKey() List<LikeInfo> get likes {
  if (_likes is EqualUnmodifiableListView) return _likes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_likes);
}


/// Create a copy of LikeTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeTaskDataCopyWith<_LikeTaskData> get copyWith => __$LikeTaskDataCopyWithImpl<_LikeTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikeTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&const DeepCollectionEquality().equals(other._likes, _likes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numOfLikes,const DeepCollectionEquality().hash(_likes));

@override
String toString() {
  return 'LikeTaskData(id: $id, numOfLikes: $numOfLikes, likes: $likes)';
}


}

/// @nodoc
abstract mixin class _$LikeTaskDataCopyWith<$Res> implements $LikeTaskDataCopyWith<$Res> {
  factory _$LikeTaskDataCopyWith(_LikeTaskData value, $Res Function(_LikeTaskData) _then) = __$LikeTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String? id, int? numOfLikes, List<LikeInfo> likes
});




}
/// @nodoc
class __$LikeTaskDataCopyWithImpl<$Res>
    implements _$LikeTaskDataCopyWith<$Res> {
  __$LikeTaskDataCopyWithImpl(this._self, this._then);

  final _LikeTaskData _self;
  final $Res Function(_LikeTaskData) _then;

/// Create a copy of LikeTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numOfLikes = freezed,Object? likes = null,}) {
  return _then(_LikeTaskData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,likes: null == likes ? _self._likes : likes // ignore: cast_nullable_to_non_nullable
as List<LikeInfo>,
  ));
}


}


/// @nodoc
mixin _$LikeInfo {

 String? get taskId; String? get userId; bool? get likeStatus; String? get createdAt;
/// Create a copy of LikeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikeInfoCopyWith<LikeInfo> get copyWith => _$LikeInfoCopyWithImpl<LikeInfo>(this as LikeInfo, _$identity);

  /// Serializes this LikeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikeInfo&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.likeStatus, likeStatus) || other.likeStatus == likeStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,userId,likeStatus,createdAt);

@override
String toString() {
  return 'LikeInfo(taskId: $taskId, userId: $userId, likeStatus: $likeStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LikeInfoCopyWith<$Res>  {
  factory $LikeInfoCopyWith(LikeInfo value, $Res Function(LikeInfo) _then) = _$LikeInfoCopyWithImpl;
@useResult
$Res call({
 String? taskId, String? userId, bool? likeStatus, String? createdAt
});




}
/// @nodoc
class _$LikeInfoCopyWithImpl<$Res>
    implements $LikeInfoCopyWith<$Res> {
  _$LikeInfoCopyWithImpl(this._self, this._then);

  final LikeInfo _self;
  final $Res Function(LikeInfo) _then;

/// Create a copy of LikeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = freezed,Object? userId = freezed,Object? likeStatus = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,likeStatus: freezed == likeStatus ? _self.likeStatus : likeStatus // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LikeInfo].
extension LikeInfoPatterns on LikeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LikeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LikeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LikeInfo value)  $default,){
final _that = this;
switch (_that) {
case _LikeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LikeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LikeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? taskId,  String? userId,  bool? likeStatus,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LikeInfo() when $default != null:
return $default(_that.taskId,_that.userId,_that.likeStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? taskId,  String? userId,  bool? likeStatus,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _LikeInfo():
return $default(_that.taskId,_that.userId,_that.likeStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? taskId,  String? userId,  bool? likeStatus,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LikeInfo() when $default != null:
return $default(_that.taskId,_that.userId,_that.likeStatus,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LikeInfo implements LikeInfo {
  const _LikeInfo({this.taskId, this.userId, this.likeStatus, this.createdAt});
  factory _LikeInfo.fromJson(Map<String, dynamic> json) => _$LikeInfoFromJson(json);

@override final  String? taskId;
@override final  String? userId;
@override final  bool? likeStatus;
@override final  String? createdAt;

/// Create a copy of LikeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeInfoCopyWith<_LikeInfo> get copyWith => __$LikeInfoCopyWithImpl<_LikeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikeInfo&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.likeStatus, likeStatus) || other.likeStatus == likeStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,userId,likeStatus,createdAt);

@override
String toString() {
  return 'LikeInfo(taskId: $taskId, userId: $userId, likeStatus: $likeStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LikeInfoCopyWith<$Res> implements $LikeInfoCopyWith<$Res> {
  factory _$LikeInfoCopyWith(_LikeInfo value, $Res Function(_LikeInfo) _then) = __$LikeInfoCopyWithImpl;
@override @useResult
$Res call({
 String? taskId, String? userId, bool? likeStatus, String? createdAt
});




}
/// @nodoc
class __$LikeInfoCopyWithImpl<$Res>
    implements _$LikeInfoCopyWith<$Res> {
  __$LikeInfoCopyWithImpl(this._self, this._then);

  final _LikeInfo _self;
  final $Res Function(_LikeInfo) _then;

/// Create a copy of LikeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = freezed,Object? userId = freezed,Object? likeStatus = freezed,Object? createdAt = freezed,}) {
  return _then(_LikeInfo(
taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,likeStatus: freezed == likeStatus ? _self.likeStatus : likeStatus // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
