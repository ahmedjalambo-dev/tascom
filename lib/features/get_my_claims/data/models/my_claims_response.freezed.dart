// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_claims_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyClaimsResponse {

 bool get success; List<MyClaimData> get data;
/// Create a copy of MyClaimsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyClaimsResponseCopyWith<MyClaimsResponse> get copyWith => _$MyClaimsResponseCopyWithImpl<MyClaimsResponse>(this as MyClaimsResponse, _$identity);

  /// Serializes this MyClaimsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyClaimsResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MyClaimsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $MyClaimsResponseCopyWith<$Res>  {
  factory $MyClaimsResponseCopyWith(MyClaimsResponse value, $Res Function(MyClaimsResponse) _then) = _$MyClaimsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<MyClaimData> data
});




}
/// @nodoc
class _$MyClaimsResponseCopyWithImpl<$Res>
    implements $MyClaimsResponseCopyWith<$Res> {
  _$MyClaimsResponseCopyWithImpl(this._self, this._then);

  final MyClaimsResponse _self;
  final $Res Function(MyClaimsResponse) _then;

/// Create a copy of MyClaimsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MyClaimData>,
  ));
}

}


/// Adds pattern-matching-related methods to [MyClaimsResponse].
extension MyClaimsResponsePatterns on MyClaimsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyClaimsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyClaimsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyClaimsResponse value)  $default,){
final _that = this;
switch (_that) {
case _MyClaimsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyClaimsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MyClaimsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<MyClaimData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyClaimsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<MyClaimData> data)  $default,) {final _that = this;
switch (_that) {
case _MyClaimsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<MyClaimData> data)?  $default,) {final _that = this;
switch (_that) {
case _MyClaimsResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyClaimsResponse implements MyClaimsResponse {
  const _MyClaimsResponse({required this.success, required final  List<MyClaimData> data}): _data = data;
  factory _MyClaimsResponse.fromJson(Map<String, dynamic> json) => _$MyClaimsResponseFromJson(json);

@override final  bool success;
 final  List<MyClaimData> _data;
@override List<MyClaimData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of MyClaimsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyClaimsResponseCopyWith<_MyClaimsResponse> get copyWith => __$MyClaimsResponseCopyWithImpl<_MyClaimsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyClaimsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyClaimsResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MyClaimsResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MyClaimsResponseCopyWith<$Res> implements $MyClaimsResponseCopyWith<$Res> {
  factory _$MyClaimsResponseCopyWith(_MyClaimsResponse value, $Res Function(_MyClaimsResponse) _then) = __$MyClaimsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<MyClaimData> data
});




}
/// @nodoc
class __$MyClaimsResponseCopyWithImpl<$Res>
    implements _$MyClaimsResponseCopyWith<$Res> {
  __$MyClaimsResponseCopyWithImpl(this._self, this._then);

  final _MyClaimsResponse _self;
  final $Res Function(_MyClaimsResponse) _then;

/// Create a copy of MyClaimsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_MyClaimsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MyClaimData>,
  ));
}


}


/// @nodoc
mixin _$MyClaimData {

 String get id; String get taskId; String get claimantId; String get status; String get claimedAt; ClaimedTaskData get task;
/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyClaimDataCopyWith<MyClaimData> get copyWith => _$MyClaimDataCopyWithImpl<MyClaimData>(this as MyClaimData, _$identity);

  /// Serializes this MyClaimData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyClaimData&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.claimantId, claimantId) || other.claimantId == claimantId)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt)&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,claimantId,status,claimedAt,task);

@override
String toString() {
  return 'MyClaimData(id: $id, taskId: $taskId, claimantId: $claimantId, status: $status, claimedAt: $claimedAt, task: $task)';
}


}

/// @nodoc
abstract mixin class $MyClaimDataCopyWith<$Res>  {
  factory $MyClaimDataCopyWith(MyClaimData value, $Res Function(MyClaimData) _then) = _$MyClaimDataCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String claimantId, String status, String claimedAt, ClaimedTaskData task
});


$ClaimedTaskDataCopyWith<$Res> get task;

}
/// @nodoc
class _$MyClaimDataCopyWithImpl<$Res>
    implements $MyClaimDataCopyWith<$Res> {
  _$MyClaimDataCopyWithImpl(this._self, this._then);

  final MyClaimData _self;
  final $Res Function(MyClaimData) _then;

/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? claimantId = null,Object? status = null,Object? claimedAt = null,Object? task = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,claimantId: null == claimantId ? _self.claimantId : claimantId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as ClaimedTaskData,
  ));
}
/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimedTaskDataCopyWith<$Res> get task {
  
  return $ClaimedTaskDataCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyClaimData].
extension MyClaimDataPatterns on MyClaimData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyClaimData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyClaimData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyClaimData value)  $default,){
final _that = this;
switch (_that) {
case _MyClaimData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyClaimData value)?  $default,){
final _that = this;
switch (_that) {
case _MyClaimData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt,  ClaimedTaskData task)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyClaimData() when $default != null:
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt,_that.task);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt,  ClaimedTaskData task)  $default,) {final _that = this;
switch (_that) {
case _MyClaimData():
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt,_that.task);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String claimantId,  String status,  String claimedAt,  ClaimedTaskData task)?  $default,) {final _that = this;
switch (_that) {
case _MyClaimData() when $default != null:
return $default(_that.id,_that.taskId,_that.claimantId,_that.status,_that.claimedAt,_that.task);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyClaimData implements MyClaimData {
  const _MyClaimData({required this.id, required this.taskId, required this.claimantId, required this.status, required this.claimedAt, required this.task});
  factory _MyClaimData.fromJson(Map<String, dynamic> json) => _$MyClaimDataFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  String claimantId;
@override final  String status;
@override final  String claimedAt;
@override final  ClaimedTaskData task;

/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyClaimDataCopyWith<_MyClaimData> get copyWith => __$MyClaimDataCopyWithImpl<_MyClaimData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyClaimDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyClaimData&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.claimantId, claimantId) || other.claimantId == claimantId)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimedAt, claimedAt) || other.claimedAt == claimedAt)&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,claimantId,status,claimedAt,task);

@override
String toString() {
  return 'MyClaimData(id: $id, taskId: $taskId, claimantId: $claimantId, status: $status, claimedAt: $claimedAt, task: $task)';
}


}

/// @nodoc
abstract mixin class _$MyClaimDataCopyWith<$Res> implements $MyClaimDataCopyWith<$Res> {
  factory _$MyClaimDataCopyWith(_MyClaimData value, $Res Function(_MyClaimData) _then) = __$MyClaimDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String claimantId, String status, String claimedAt, ClaimedTaskData task
});


@override $ClaimedTaskDataCopyWith<$Res> get task;

}
/// @nodoc
class __$MyClaimDataCopyWithImpl<$Res>
    implements _$MyClaimDataCopyWith<$Res> {
  __$MyClaimDataCopyWithImpl(this._self, this._then);

  final _MyClaimData _self;
  final $Res Function(_MyClaimData) _then;

/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? claimantId = null,Object? status = null,Object? claimedAt = null,Object? task = null,}) {
  return _then(_MyClaimData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,claimantId: null == claimantId ? _self.claimantId : claimantId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,claimedAt: null == claimedAt ? _self.claimedAt : claimedAt // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as ClaimedTaskData,
  ));
}

/// Create a copy of MyClaimData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimedTaskDataCopyWith<$Res> get task {
  
  return $ClaimedTaskDataCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// @nodoc
mixin _$ClaimedTaskData {

 String get id; String get creatorId; String? get assigneeId; String get title; String get description; double? get latitude; double? get longitude; String? get deadline; int? get pointsOffered; String get status; String get priority; String get category; int? get numOfLikes; String get createdAt; String? get completedAt; String? get updatedAt; bool? get isDeleted;
/// Create a copy of ClaimedTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimedTaskDataCopyWith<ClaimedTaskData> get copyWith => _$ClaimedTaskDataCopyWithImpl<ClaimedTaskData>(this as ClaimedTaskData, _$identity);

  /// Serializes this ClaimedTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimedTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted);

@override
String toString() {
  return 'ClaimedTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $ClaimedTaskDataCopyWith<$Res>  {
  factory $ClaimedTaskDataCopyWith(ClaimedTaskData value, $Res Function(ClaimedTaskData) _then) = _$ClaimedTaskDataCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted
});




}
/// @nodoc
class _$ClaimedTaskDataCopyWithImpl<$Res>
    implements $ClaimedTaskDataCopyWith<$Res> {
  _$ClaimedTaskDataCopyWithImpl(this._self, this._then);

  final ClaimedTaskData _self;
  final $Res Function(ClaimedTaskData) _then;

/// Create a copy of ClaimedTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,pointsOffered: freezed == pointsOffered ? _self.pointsOffered : pointsOffered // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimedTaskData].
extension ClaimedTaskDataPatterns on ClaimedTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimedTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimedTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimedTaskData value)  $default,){
final _that = this;
switch (_that) {
case _ClaimedTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimedTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimedTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimedTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted)  $default,) {final _that = this;
switch (_that) {
case _ClaimedTaskData():
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _ClaimedTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimedTaskData implements ClaimedTaskData {
  const _ClaimedTaskData({required this.id, required this.creatorId, this.assigneeId, required this.title, required this.description, this.latitude, this.longitude, this.deadline, this.pointsOffered, required this.status, required this.priority, required this.category, this.numOfLikes, required this.createdAt, this.completedAt, this.updatedAt, this.isDeleted});
  factory _ClaimedTaskData.fromJson(Map<String, dynamic> json) => _$ClaimedTaskDataFromJson(json);

@override final  String id;
@override final  String creatorId;
@override final  String? assigneeId;
@override final  String title;
@override final  String description;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? deadline;
@override final  int? pointsOffered;
@override final  String status;
@override final  String priority;
@override final  String category;
@override final  int? numOfLikes;
@override final  String createdAt;
@override final  String? completedAt;
@override final  String? updatedAt;
@override final  bool? isDeleted;

/// Create a copy of ClaimedTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimedTaskDataCopyWith<_ClaimedTaskData> get copyWith => __$ClaimedTaskDataCopyWithImpl<_ClaimedTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimedTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimedTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted);

@override
String toString() {
  return 'ClaimedTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$ClaimedTaskDataCopyWith<$Res> implements $ClaimedTaskDataCopyWith<$Res> {
  factory _$ClaimedTaskDataCopyWith(_ClaimedTaskData value, $Res Function(_ClaimedTaskData) _then) = __$ClaimedTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted
});




}
/// @nodoc
class __$ClaimedTaskDataCopyWithImpl<$Res>
    implements _$ClaimedTaskDataCopyWith<$Res> {
  __$ClaimedTaskDataCopyWithImpl(this._self, this._then);

  final _ClaimedTaskData _self;
  final $Res Function(_ClaimedTaskData) _then;

/// Create a copy of ClaimedTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,}) {
  return _then(_ClaimedTaskData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,pointsOffered: freezed == pointsOffered ? _self.pointsOffered : pointsOffered // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
