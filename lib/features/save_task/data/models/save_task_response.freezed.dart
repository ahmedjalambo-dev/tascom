// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveTaskResponse {

 bool? get success; SaveTaskData? get data;
/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveTaskResponseCopyWith<SaveTaskResponse> get copyWith => _$SaveTaskResponseCopyWithImpl<SaveTaskResponse>(this as SaveTaskResponse, _$identity);

  /// Serializes this SaveTaskResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SaveTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SaveTaskResponseCopyWith<$Res>  {
  factory $SaveTaskResponseCopyWith(SaveTaskResponse value, $Res Function(SaveTaskResponse) _then) = _$SaveTaskResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, SaveTaskData? data
});


$SaveTaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SaveTaskResponseCopyWithImpl<$Res>
    implements $SaveTaskResponseCopyWith<$Res> {
  _$SaveTaskResponseCopyWithImpl(this._self, this._then);

  final SaveTaskResponse _self;
  final $Res Function(SaveTaskResponse) _then;

/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SaveTaskData?,
  ));
}
/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaveTaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SaveTaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaveTaskResponse].
extension SaveTaskResponsePatterns on SaveTaskResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveTaskResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveTaskResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveTaskResponse value)  $default,){
final _that = this;
switch (_that) {
case _SaveTaskResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveTaskResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SaveTaskResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  SaveTaskData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveTaskResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  SaveTaskData? data)  $default,) {final _that = this;
switch (_that) {
case _SaveTaskResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  SaveTaskData? data)?  $default,) {final _that = this;
switch (_that) {
case _SaveTaskResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaveTaskResponse implements SaveTaskResponse {
  const _SaveTaskResponse({this.success, this.data});
  factory _SaveTaskResponse.fromJson(Map<String, dynamic> json) => _$SaveTaskResponseFromJson(json);

@override final  bool? success;
@override final  SaveTaskData? data;

/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTaskResponseCopyWith<_SaveTaskResponse> get copyWith => __$SaveTaskResponseCopyWithImpl<_SaveTaskResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaveTaskResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'SaveTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SaveTaskResponseCopyWith<$Res> implements $SaveTaskResponseCopyWith<$Res> {
  factory _$SaveTaskResponseCopyWith(_SaveTaskResponse value, $Res Function(_SaveTaskResponse) _then) = __$SaveTaskResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, SaveTaskData? data
});


@override $SaveTaskDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$SaveTaskResponseCopyWithImpl<$Res>
    implements _$SaveTaskResponseCopyWith<$Res> {
  __$SaveTaskResponseCopyWithImpl(this._self, this._then);

  final _SaveTaskResponse _self;
  final $Res Function(_SaveTaskResponse) _then;

/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = freezed,}) {
  return _then(_SaveTaskResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SaveTaskData?,
  ));
}

/// Create a copy of SaveTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaveTaskDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SaveTaskDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SaveTaskData {

 String? get taskId; String? get userId; bool? get isSaved; String? get createdAt;
/// Create a copy of SaveTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveTaskDataCopyWith<SaveTaskData> get copyWith => _$SaveTaskDataCopyWithImpl<SaveTaskData>(this as SaveTaskData, _$identity);

  /// Serializes this SaveTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveTaskData&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,userId,isSaved,createdAt);

@override
String toString() {
  return 'SaveTaskData(taskId: $taskId, userId: $userId, isSaved: $isSaved, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SaveTaskDataCopyWith<$Res>  {
  factory $SaveTaskDataCopyWith(SaveTaskData value, $Res Function(SaveTaskData) _then) = _$SaveTaskDataCopyWithImpl;
@useResult
$Res call({
 String? taskId, String? userId, bool? isSaved, String? createdAt
});




}
/// @nodoc
class _$SaveTaskDataCopyWithImpl<$Res>
    implements $SaveTaskDataCopyWith<$Res> {
  _$SaveTaskDataCopyWithImpl(this._self, this._then);

  final SaveTaskData _self;
  final $Res Function(SaveTaskData) _then;

/// Create a copy of SaveTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = freezed,Object? userId = freezed,Object? isSaved = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isSaved: freezed == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveTaskData].
extension SaveTaskDataPatterns on SaveTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveTaskData value)  $default,){
final _that = this;
switch (_that) {
case _SaveTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _SaveTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? taskId,  String? userId,  bool? isSaved,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveTaskData() when $default != null:
return $default(_that.taskId,_that.userId,_that.isSaved,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? taskId,  String? userId,  bool? isSaved,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SaveTaskData():
return $default(_that.taskId,_that.userId,_that.isSaved,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? taskId,  String? userId,  bool? isSaved,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SaveTaskData() when $default != null:
return $default(_that.taskId,_that.userId,_that.isSaved,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaveTaskData implements SaveTaskData {
  const _SaveTaskData({this.taskId, this.userId, this.isSaved, this.createdAt});
  factory _SaveTaskData.fromJson(Map<String, dynamic> json) => _$SaveTaskDataFromJson(json);

@override final  String? taskId;
@override final  String? userId;
@override final  bool? isSaved;
@override final  String? createdAt;

/// Create a copy of SaveTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveTaskDataCopyWith<_SaveTaskData> get copyWith => __$SaveTaskDataCopyWithImpl<_SaveTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaveTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveTaskData&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taskId,userId,isSaved,createdAt);

@override
String toString() {
  return 'SaveTaskData(taskId: $taskId, userId: $userId, isSaved: $isSaved, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SaveTaskDataCopyWith<$Res> implements $SaveTaskDataCopyWith<$Res> {
  factory _$SaveTaskDataCopyWith(_SaveTaskData value, $Res Function(_SaveTaskData) _then) = __$SaveTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String? taskId, String? userId, bool? isSaved, String? createdAt
});




}
/// @nodoc
class __$SaveTaskDataCopyWithImpl<$Res>
    implements _$SaveTaskDataCopyWith<$Res> {
  __$SaveTaskDataCopyWithImpl(this._self, this._then);

  final _SaveTaskData _self;
  final $Res Function(_SaveTaskData) _then;

/// Create a copy of SaveTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = freezed,Object? userId = freezed,Object? isSaved = freezed,Object? createdAt = freezed,}) {
  return _then(_SaveTaskData(
taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isSaved: freezed == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
