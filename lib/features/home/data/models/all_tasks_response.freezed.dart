// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_tasks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllTasksResponse {

 bool get success; List<TaskResponseData> get data; PaginationMeta get meta;
/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllTasksResponseCopyWith<AllTasksResponse> get copyWith => _$AllTasksResponseCopyWithImpl<AllTasksResponse>(this as AllTasksResponse, _$identity);

  /// Serializes this AllTasksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'AllTasksResponse(success: $success, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AllTasksResponseCopyWith<$Res>  {
  factory $AllTasksResponseCopyWith(AllTasksResponse value, $Res Function(AllTasksResponse) _then) = _$AllTasksResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<TaskResponseData> data, PaginationMeta meta
});


$PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$AllTasksResponseCopyWithImpl<$Res>
    implements $AllTasksResponseCopyWith<$Res> {
  _$AllTasksResponseCopyWithImpl(this._self, this._then);

  final AllTasksResponse _self;
  final $Res Function(AllTasksResponse) _then;

/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TaskResponseData>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [AllTasksResponse].
extension AllTasksResponsePatterns on AllTasksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllTasksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllTasksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllTasksResponse value)  $default,){
final _that = this;
switch (_that) {
case _AllTasksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllTasksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AllTasksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<TaskResponseData> data,  PaginationMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllTasksResponse() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<TaskResponseData> data,  PaginationMeta meta)  $default,) {final _that = this;
switch (_that) {
case _AllTasksResponse():
return $default(_that.success,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<TaskResponseData> data,  PaginationMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _AllTasksResponse() when $default != null:
return $default(_that.success,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllTasksResponse implements AllTasksResponse {
  const _AllTasksResponse({required this.success, required final  List<TaskResponseData> data, required this.meta}): _data = data;
  factory _AllTasksResponse.fromJson(Map<String, dynamic> json) => _$AllTasksResponseFromJson(json);

@override final  bool success;
 final  List<TaskResponseData> _data;
@override List<TaskResponseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta meta;

/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllTasksResponseCopyWith<_AllTasksResponse> get copyWith => __$AllTasksResponseCopyWithImpl<_AllTasksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllTasksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'AllTasksResponse(success: $success, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AllTasksResponseCopyWith<$Res> implements $AllTasksResponseCopyWith<$Res> {
  factory _$AllTasksResponseCopyWith(_AllTasksResponse value, $Res Function(_AllTasksResponse) _then) = __$AllTasksResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<TaskResponseData> data, PaginationMeta meta
});


@override $PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$AllTasksResponseCopyWithImpl<$Res>
    implements _$AllTasksResponseCopyWith<$Res> {
  __$AllTasksResponseCopyWithImpl(this._self, this._then);

  final _AllTasksResponse _self;
  final $Res Function(_AllTasksResponse) _then;

/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,Object? meta = null,}) {
  return _then(_AllTasksResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TaskResponseData>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of AllTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$TaskResponseData {

 String get id; String get creatorId; String get title; String get description; double? get latitude; double? get longitude; String? get deadline; int? get pointsOffered; String get status; String get priority; String get category; bool? get saved; int? get numOfLikes; String get createdAt; String? get updatedAt; bool? get isDeleted;
/// Create a copy of TaskResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskResponseDataCopyWith<TaskResponseData> get copyWith => _$TaskResponseDataCopyWithImpl<TaskResponseData>(this as TaskResponseData, _$identity);

  /// Serializes this TaskResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,saved,numOfLikes,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'TaskResponseData(id: $id, creatorId: $creatorId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, saved: $saved, numOfLikes: $numOfLikes, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $TaskResponseDataCopyWith<$Res>  {
  factory $TaskResponseDataCopyWith(TaskResponseData value, $Res Function(TaskResponseData) _then) = _$TaskResponseDataCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, bool? saved, int? numOfLikes, String createdAt, String? updatedAt, bool? isDeleted
});




}
/// @nodoc
class _$TaskResponseDataCopyWithImpl<$Res>
    implements $TaskResponseDataCopyWith<$Res> {
  _$TaskResponseDataCopyWithImpl(this._self, this._then);

  final TaskResponseData _self;
  final $Res Function(TaskResponseData) _then;

/// Create a copy of TaskResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? saved = freezed,Object? numOfLikes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? isDeleted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,pointsOffered: freezed == pointsOffered ? _self.pointsOffered : pointsOffered // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,saved: freezed == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool?,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskResponseData].
extension TaskResponseDataPatterns on TaskResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskResponseData value)  $default,){
final _that = this;
switch (_that) {
case _TaskResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _TaskResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  bool? saved,  int? numOfLikes,  String createdAt,  String? updatedAt,  bool? isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskResponseData() when $default != null:
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.saved,_that.numOfLikes,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  bool? saved,  int? numOfLikes,  String createdAt,  String? updatedAt,  bool? isDeleted)  $default,) {final _that = this;
switch (_that) {
case _TaskResponseData():
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.saved,_that.numOfLikes,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  bool? saved,  int? numOfLikes,  String createdAt,  String? updatedAt,  bool? isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _TaskResponseData() when $default != null:
return $default(_that.id,_that.creatorId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.saved,_that.numOfLikes,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskResponseData implements TaskResponseData {
  const _TaskResponseData({required this.id, required this.creatorId, required this.title, required this.description, this.latitude, this.longitude, this.deadline, this.pointsOffered, required this.status, required this.priority, required this.category, this.saved, this.numOfLikes, required this.createdAt, this.updatedAt, this.isDeleted});
  factory _TaskResponseData.fromJson(Map<String, dynamic> json) => _$TaskResponseDataFromJson(json);

@override final  String id;
@override final  String creatorId;
@override final  String title;
@override final  String description;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? deadline;
@override final  int? pointsOffered;
@override final  String status;
@override final  String priority;
@override final  String category;
@override final  bool? saved;
@override final  int? numOfLikes;
@override final  String createdAt;
@override final  String? updatedAt;
@override final  bool? isDeleted;

/// Create a copy of TaskResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskResponseDataCopyWith<_TaskResponseData> get copyWith => __$TaskResponseDataCopyWithImpl<_TaskResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.saved, saved) || other.saved == saved)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,saved,numOfLikes,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'TaskResponseData(id: $id, creatorId: $creatorId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, saved: $saved, numOfLikes: $numOfLikes, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$TaskResponseDataCopyWith<$Res> implements $TaskResponseDataCopyWith<$Res> {
  factory _$TaskResponseDataCopyWith(_TaskResponseData value, $Res Function(_TaskResponseData) _then) = __$TaskResponseDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, bool? saved, int? numOfLikes, String createdAt, String? updatedAt, bool? isDeleted
});




}
/// @nodoc
class __$TaskResponseDataCopyWithImpl<$Res>
    implements _$TaskResponseDataCopyWith<$Res> {
  __$TaskResponseDataCopyWithImpl(this._self, this._then);

  final _TaskResponseData _self;
  final $Res Function(_TaskResponseData) _then;

/// Create a copy of TaskResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? saved = freezed,Object? numOfLikes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? isDeleted = freezed,}) {
  return _then(_TaskResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,pointsOffered: freezed == pointsOffered ? _self.pointsOffered : pointsOffered // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,saved: freezed == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool?,numOfLikes: freezed == numOfLikes ? _self.numOfLikes : numOfLikes // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$PaginationMeta {

 int get total; int get page; int get limit; int get totalPages;
/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<PaginationMeta> get copyWith => _$PaginationMetaCopyWithImpl<PaginationMeta>(this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'PaginationMeta(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._self, this._then);

  final PaginationMeta _self;
  final $Res Function(PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMeta].
extension PaginationMetaPatterns on PaginationMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMeta value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMeta value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta():
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta implements PaginationMeta {
  const _PaginationMeta({required this.total, required this.page, required this.limit, required this.totalPages});
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override final  int total;
@override final  int page;
@override final  int limit;
@override final  int totalPages;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaCopyWith<_PaginationMeta> get copyWith => __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'PaginationMeta(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(this._self, this._then);

  final _PaginationMeta _self;
  final $Res Function(_PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_PaginationMeta(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
