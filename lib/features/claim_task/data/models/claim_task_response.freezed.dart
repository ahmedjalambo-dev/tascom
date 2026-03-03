// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_task_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClaimTaskResponse {

 bool get success; ClaimTaskData get data;
/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimTaskResponseCopyWith<ClaimTaskResponse> get copyWith => _$ClaimTaskResponseCopyWithImpl<ClaimTaskResponse>(this as ClaimTaskResponse, _$identity);

  /// Serializes this ClaimTaskResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ClaimTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $ClaimTaskResponseCopyWith<$Res>  {
  factory $ClaimTaskResponseCopyWith(ClaimTaskResponse value, $Res Function(ClaimTaskResponse) _then) = _$ClaimTaskResponseCopyWithImpl;
@useResult
$Res call({
 bool success, ClaimTaskData data
});


$ClaimTaskDataCopyWith<$Res> get data;

}
/// @nodoc
class _$ClaimTaskResponseCopyWithImpl<$Res>
    implements $ClaimTaskResponseCopyWith<$Res> {
  _$ClaimTaskResponseCopyWithImpl(this._self, this._then);

  final ClaimTaskResponse _self;
  final $Res Function(ClaimTaskResponse) _then;

/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClaimTaskData,
  ));
}
/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimTaskDataCopyWith<$Res> get data {
  
  return $ClaimTaskDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClaimTaskResponse].
extension ClaimTaskResponsePatterns on ClaimTaskResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimTaskResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimTaskResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimTaskResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClaimTaskResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimTaskResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimTaskResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  ClaimTaskData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimTaskResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  ClaimTaskData data)  $default,) {final _that = this;
switch (_that) {
case _ClaimTaskResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  ClaimTaskData data)?  $default,) {final _that = this;
switch (_that) {
case _ClaimTaskResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimTaskResponse implements ClaimTaskResponse {
  const _ClaimTaskResponse({required this.success, required this.data});
  factory _ClaimTaskResponse.fromJson(Map<String, dynamic> json) => _$ClaimTaskResponseFromJson(json);

@override final  bool success;
@override final  ClaimTaskData data;

/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimTaskResponseCopyWith<_ClaimTaskResponse> get copyWith => __$ClaimTaskResponseCopyWithImpl<_ClaimTaskResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimTaskResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimTaskResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ClaimTaskResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ClaimTaskResponseCopyWith<$Res> implements $ClaimTaskResponseCopyWith<$Res> {
  factory _$ClaimTaskResponseCopyWith(_ClaimTaskResponse value, $Res Function(_ClaimTaskResponse) _then) = __$ClaimTaskResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, ClaimTaskData data
});


@override $ClaimTaskDataCopyWith<$Res> get data;

}
/// @nodoc
class __$ClaimTaskResponseCopyWithImpl<$Res>
    implements _$ClaimTaskResponseCopyWith<$Res> {
  __$ClaimTaskResponseCopyWithImpl(this._self, this._then);

  final _ClaimTaskResponse _self;
  final $Res Function(_ClaimTaskResponse) _then;

/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_ClaimTaskResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ClaimTaskData,
  ));
}

/// Create a copy of ClaimTaskResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimTaskDataCopyWith<$Res> get data {
  
  return $ClaimTaskDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ClaimTaskData {

 String get id; String get taskId; String get claimantId; String get status; String get claimedAt;
/// Create a copy of ClaimTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimTaskDataCopyWith<ClaimTaskData> get copyWith => _$ClaimTaskDataCopyWithImpl<ClaimTaskData>(this as ClaimTaskData, _$identity);

  /// Serializes this ClaimTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.claimantId, claimantId) || other.claimantId == claimantId)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,claimantId,status,claimedAt);

@override
String toString() {
  return 'ClaimTaskData(id: $id, taskId: $taskId, claimantId: $claimantId, status: $status, claimedAt: $claimedAt)';
}


}

/// @nodoc
abstract mixin class $ClaimTaskDataCopyWith<$Res>  {
  factory $ClaimTaskDataCopyWith(ClaimTaskData value, $Res Function(ClaimTaskData) _then) = _$ClaimTaskDataCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String claimantId, String status, String claimedAt
});




}
/// @nodoc
class _$ClaimTaskDataCopyWithImpl<$Res>
    implements $ClaimTaskDataCopyWith<$Res> {
  _$ClaimTaskDataCopyWithImpl(this._self, this._then);

  final ClaimTaskData _self;
  final $Res Function(ClaimTaskData) _then;

/// Create a copy of ClaimTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? claimantId = null,Object? status = null,Object? claimedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,claimantId: null == claimantId ? _self.claimantId : claimantId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimTaskData].
extension ClaimTaskDataPatterns on ClaimTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimTaskData value)  $default,){
final _that = this;
switch (_that) {
case _ClaimTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimTaskData() when $default != null:
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt)  $default,) {final _that = this;
switch (_that) {
case _ClaimTaskData():
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt)?  $default,) {final _that = this;
switch (_that) {
case _ClaimTaskData() when $default != null:
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimTaskData implements ClaimTaskData {
  const _ClaimTaskData({required this.id, required this.taskId, required this.claimantId, required this.status, required this.claimedAt});
  factory _ClaimTaskData.fromJson(Map<String, dynamic> json) => _$ClaimTaskDataFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  String claimantId;
@override final  String status;
@override final  String claimedAt;

/// Create a copy of ClaimTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimTaskDataCopyWith<_ClaimTaskData> get copyWith => __$ClaimTaskDataCopyWithImpl<_ClaimTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.claimantId, claimantId) || other.claimantId == claimantId)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,claimantId,status,claimedAt);

@override
String toString() {
  return 'ClaimTaskData(id: $id, taskId: $taskId, claimantId: $claimantId, status: $status, claimedAt: $claimedAt)';
}


}

/// @nodoc
abstract mixin class _$ClaimTaskDataCopyWith<$Res> implements $ClaimTaskDataCopyWith<$Res> {
  factory _$ClaimTaskDataCopyWith(_ClaimTaskData value, $Res Function(_ClaimTaskData) _then) = __$ClaimTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String claimantId, String status, String claimedAt
});




}
/// @nodoc
class __$ClaimTaskDataCopyWithImpl<$Res>
    implements _$ClaimTaskDataCopyWith<$Res> {
  __$ClaimTaskDataCopyWithImpl(this._self, this._then);

  final _ClaimTaskData _self;
  final $Res Function(_ClaimTaskData) _then;

/// Create a copy of ClaimTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? claimantId = null,Object? status = null,Object? claimedAt = null,}) {
  return _then(_ClaimTaskData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,claimantId: null == claimantId ? _self.claimantId : claimantId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
