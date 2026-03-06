// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_tasks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapTasksResponse {

 bool get success; MapTasksData get data;
/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapTasksResponseCopyWith<MapTasksResponse> get copyWith => _$MapTasksResponseCopyWithImpl<MapTasksResponse>(this as MapTasksResponse, _$identity);

  /// Serializes this MapTasksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapTasksResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'MapTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $MapTasksResponseCopyWith<$Res>  {
  factory $MapTasksResponseCopyWith(MapTasksResponse value, $Res Function(MapTasksResponse) _then) = _$MapTasksResponseCopyWithImpl;
@useResult
$Res call({
 bool success, MapTasksData data
});


$MapTasksDataCopyWith<$Res> get data;

}
/// @nodoc
class _$MapTasksResponseCopyWithImpl<$Res>
    implements $MapTasksResponseCopyWith<$Res> {
  _$MapTasksResponseCopyWithImpl(this._self, this._then);

  final MapTasksResponse _self;
  final $Res Function(MapTasksResponse) _then;

/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MapTasksData,
  ));
}
/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapTasksDataCopyWith<$Res> get data {
  
  return $MapTasksDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapTasksResponse].
extension MapTasksResponsePatterns on MapTasksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapTasksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapTasksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapTasksResponse value)  $default,){
final _that = this;
switch (_that) {
case _MapTasksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapTasksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MapTasksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  MapTasksData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapTasksResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  MapTasksData data)  $default,) {final _that = this;
switch (_that) {
case _MapTasksResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  MapTasksData data)?  $default,) {final _that = this;
switch (_that) {
case _MapTasksResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapTasksResponse implements MapTasksResponse {
  const _MapTasksResponse({required this.success, required this.data});
  factory _MapTasksResponse.fromJson(Map<String, dynamic> json) => _$MapTasksResponseFromJson(json);

@override final  bool success;
@override final  MapTasksData data;

/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapTasksResponseCopyWith<_MapTasksResponse> get copyWith => __$MapTasksResponseCopyWithImpl<_MapTasksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapTasksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapTasksResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'MapTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MapTasksResponseCopyWith<$Res> implements $MapTasksResponseCopyWith<$Res> {
  factory _$MapTasksResponseCopyWith(_MapTasksResponse value, $Res Function(_MapTasksResponse) _then) = __$MapTasksResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, MapTasksData data
});


@override $MapTasksDataCopyWith<$Res> get data;

}
/// @nodoc
class __$MapTasksResponseCopyWithImpl<$Res>
    implements _$MapTasksResponseCopyWith<$Res> {
  __$MapTasksResponseCopyWithImpl(this._self, this._then);

  final _MapTasksResponse _self;
  final $Res Function(_MapTasksResponse) _then;

/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_MapTasksResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MapTasksData,
  ));
}

/// Create a copy of MapTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapTasksDataCopyWith<$Res> get data {
  
  return $MapTasksDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MapTasksData {

 List<MapTaskData> get data; int get total;
/// Create a copy of MapTasksData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapTasksDataCopyWith<MapTasksData> get copyWith => _$MapTasksDataCopyWithImpl<MapTasksData>(this as MapTasksData, _$identity);

  /// Serializes this MapTasksData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapTasksData&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total);

@override
String toString() {
  return 'MapTasksData(data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class $MapTasksDataCopyWith<$Res>  {
  factory $MapTasksDataCopyWith(MapTasksData value, $Res Function(MapTasksData) _then) = _$MapTasksDataCopyWithImpl;
@useResult
$Res call({
 List<MapTaskData> data, int total
});




}
/// @nodoc
class _$MapTasksDataCopyWithImpl<$Res>
    implements $MapTasksDataCopyWith<$Res> {
  _$MapTasksDataCopyWithImpl(this._self, this._then);

  final MapTasksData _self;
  final $Res Function(MapTasksData) _then;

/// Create a copy of MapTasksData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MapTaskData>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MapTasksData].
extension MapTasksDataPatterns on MapTasksData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapTasksData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapTasksData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapTasksData value)  $default,){
final _that = this;
switch (_that) {
case _MapTasksData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapTasksData value)?  $default,){
final _that = this;
switch (_that) {
case _MapTasksData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MapTaskData> data,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapTasksData() when $default != null:
return $default(_that.data,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MapTaskData> data,  int total)  $default,) {final _that = this;
switch (_that) {
case _MapTasksData():
return $default(_that.data,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MapTaskData> data,  int total)?  $default,) {final _that = this;
switch (_that) {
case _MapTasksData() when $default != null:
return $default(_that.data,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapTasksData implements MapTasksData {
  const _MapTasksData({required final  List<MapTaskData> data, required this.total}): _data = data;
  factory _MapTasksData.fromJson(Map<String, dynamic> json) => _$MapTasksDataFromJson(json);

 final  List<MapTaskData> _data;
@override List<MapTaskData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;

/// Create a copy of MapTasksData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapTasksDataCopyWith<_MapTasksData> get copyWith => __$MapTasksDataCopyWithImpl<_MapTasksData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapTasksDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapTasksData&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total);

@override
String toString() {
  return 'MapTasksData(data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class _$MapTasksDataCopyWith<$Res> implements $MapTasksDataCopyWith<$Res> {
  factory _$MapTasksDataCopyWith(_MapTasksData value, $Res Function(_MapTasksData) _then) = __$MapTasksDataCopyWithImpl;
@override @useResult
$Res call({
 List<MapTaskData> data, int total
});




}
/// @nodoc
class __$MapTasksDataCopyWithImpl<$Res>
    implements _$MapTasksDataCopyWith<$Res> {
  __$MapTasksDataCopyWithImpl(this._self, this._then);

  final _MapTasksData _self;
  final $Res Function(_MapTasksData) _then;

/// Create a copy of MapTasksData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,}) {
  return _then(_MapTasksData(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MapTaskData>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MapTaskData {

 String get id; String get creatorId; String? get assigneeId; String get title; String get description; double? get latitude; double? get longitude; String? get deadline; int? get pointsOffered; String get status; String get priority; String get category; int? get numOfLikes; String get createdAt; String? get completedAt; String? get updatedAt; bool? get isDeleted; List<dynamic> get assets; MapTaskCreator get creator; double get distance; bool get isExpired; int? get remainingHours; int? get remainingDays;
/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapTaskDataCopyWith<MapTaskData> get copyWith => _$MapTaskDataCopyWithImpl<MapTaskData>(this as MapTaskData, _$identity);

  /// Serializes this MapTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.remainingHours, remainingHours) || other.remainingHours == remainingHours)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(assets),creator,distance,isExpired,remainingHours,remainingDays]);

@override
String toString() {
  return 'MapTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, assets: $assets, creator: $creator, distance: $distance, isExpired: $isExpired, remainingHours: $remainingHours, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class $MapTaskDataCopyWith<$Res>  {
  factory $MapTaskDataCopyWith(MapTaskData value, $Res Function(MapTaskData) _then) = _$MapTaskDataCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<dynamic> assets, MapTaskCreator creator, double distance, bool isExpired, int? remainingHours, int? remainingDays
});


$MapTaskCreatorCopyWith<$Res> get creator;

}
/// @nodoc
class _$MapTaskDataCopyWithImpl<$Res>
    implements $MapTaskDataCopyWith<$Res> {
  _$MapTaskDataCopyWithImpl(this._self, this._then);

  final MapTaskData _self;
  final $Res Function(MapTaskData) _then;

/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? assets = null,Object? creator = null,Object? distance = null,Object? isExpired = null,Object? remainingHours = freezed,Object? remainingDays = freezed,}) {
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
as bool?,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<dynamic>,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as MapTaskCreator,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,remainingHours: freezed == remainingHours ? _self.remainingHours : remainingHours // ignore: cast_nullable_to_non_nullable
as int?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapTaskCreatorCopyWith<$Res> get creator {
  
  return $MapTaskCreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapTaskData].
extension MapTaskDataPatterns on MapTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapTaskData value)  $default,){
final _that = this;
switch (_that) {
case _MapTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _MapTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<dynamic> assets,  MapTaskCreator creator,  double distance,  bool isExpired,  int? remainingHours,  int? remainingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.assets,_that.creator,_that.distance,_that.isExpired,_that.remainingHours,_that.remainingDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<dynamic> assets,  MapTaskCreator creator,  double distance,  bool isExpired,  int? remainingHours,  int? remainingDays)  $default,) {final _that = this;
switch (_that) {
case _MapTaskData():
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.assets,_that.creator,_that.distance,_that.isExpired,_that.remainingHours,_that.remainingDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<dynamic> assets,  MapTaskCreator creator,  double distance,  bool isExpired,  int? remainingHours,  int? remainingDays)?  $default,) {final _that = this;
switch (_that) {
case _MapTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.assets,_that.creator,_that.distance,_that.isExpired,_that.remainingHours,_that.remainingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapTaskData implements MapTaskData {
  const _MapTaskData({required this.id, required this.creatorId, this.assigneeId, required this.title, required this.description, this.latitude, this.longitude, this.deadline, this.pointsOffered, required this.status, required this.priority, required this.category, this.numOfLikes, required this.createdAt, this.completedAt, this.updatedAt, this.isDeleted, final  List<dynamic> assets = const [], required this.creator, this.distance = 0, this.isExpired = false, this.remainingHours, this.remainingDays}): _assets = assets;
  factory _MapTaskData.fromJson(Map<String, dynamic> json) => _$MapTaskDataFromJson(json);

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
 final  List<dynamic> _assets;
@override@JsonKey() List<dynamic> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  MapTaskCreator creator;
@override@JsonKey() final  double distance;
@override@JsonKey() final  bool isExpired;
@override final  int? remainingHours;
@override final  int? remainingDays;

/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapTaskDataCopyWith<_MapTaskData> get copyWith => __$MapTaskDataCopyWithImpl<_MapTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.remainingHours, remainingHours) || other.remainingHours == remainingHours)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(_assets),creator,distance,isExpired,remainingHours,remainingDays]);

@override
String toString() {
  return 'MapTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, assets: $assets, creator: $creator, distance: $distance, isExpired: $isExpired, remainingHours: $remainingHours, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class _$MapTaskDataCopyWith<$Res> implements $MapTaskDataCopyWith<$Res> {
  factory _$MapTaskDataCopyWith(_MapTaskData value, $Res Function(_MapTaskData) _then) = __$MapTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<dynamic> assets, MapTaskCreator creator, double distance, bool isExpired, int? remainingHours, int? remainingDays
});


@override $MapTaskCreatorCopyWith<$Res> get creator;

}
/// @nodoc
class __$MapTaskDataCopyWithImpl<$Res>
    implements _$MapTaskDataCopyWith<$Res> {
  __$MapTaskDataCopyWithImpl(this._self, this._then);

  final _MapTaskData _self;
  final $Res Function(_MapTaskData) _then;

/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? assets = null,Object? creator = null,Object? distance = null,Object? isExpired = null,Object? remainingHours = freezed,Object? remainingDays = freezed,}) {
  return _then(_MapTaskData(
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
as bool?,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<dynamic>,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as MapTaskCreator,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,remainingHours: freezed == remainingHours ? _self.remainingHours : remainingHours // ignore: cast_nullable_to_non_nullable
as int?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of MapTaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapTaskCreatorCopyWith<$Res> get creator {
  
  return $MapTaskCreatorCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$MapTaskCreator {

 String get id; String get name;
/// Create a copy of MapTaskCreator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapTaskCreatorCopyWith<MapTaskCreator> get copyWith => _$MapTaskCreatorCopyWithImpl<MapTaskCreator>(this as MapTaskCreator, _$identity);

  /// Serializes this MapTaskCreator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapTaskCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MapTaskCreator(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $MapTaskCreatorCopyWith<$Res>  {
  factory $MapTaskCreatorCopyWith(MapTaskCreator value, $Res Function(MapTaskCreator) _then) = _$MapTaskCreatorCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$MapTaskCreatorCopyWithImpl<$Res>
    implements $MapTaskCreatorCopyWith<$Res> {
  _$MapTaskCreatorCopyWithImpl(this._self, this._then);

  final MapTaskCreator _self;
  final $Res Function(MapTaskCreator) _then;

/// Create a copy of MapTaskCreator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MapTaskCreator].
extension MapTaskCreatorPatterns on MapTaskCreator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapTaskCreator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapTaskCreator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapTaskCreator value)  $default,){
final _that = this;
switch (_that) {
case _MapTaskCreator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapTaskCreator value)?  $default,){
final _that = this;
switch (_that) {
case _MapTaskCreator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapTaskCreator() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _MapTaskCreator():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _MapTaskCreator() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapTaskCreator implements MapTaskCreator {
  const _MapTaskCreator({required this.id, required this.name});
  factory _MapTaskCreator.fromJson(Map<String, dynamic> json) => _$MapTaskCreatorFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of MapTaskCreator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapTaskCreatorCopyWith<_MapTaskCreator> get copyWith => __$MapTaskCreatorCopyWithImpl<_MapTaskCreator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapTaskCreatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapTaskCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'MapTaskCreator(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MapTaskCreatorCopyWith<$Res> implements $MapTaskCreatorCopyWith<$Res> {
  factory _$MapTaskCreatorCopyWith(_MapTaskCreator value, $Res Function(_MapTaskCreator) _then) = __$MapTaskCreatorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$MapTaskCreatorCopyWithImpl<$Res>
    implements _$MapTaskCreatorCopyWith<$Res> {
  __$MapTaskCreatorCopyWithImpl(this._self, this._then);

  final _MapTaskCreator _self;
  final $Res Function(_MapTaskCreator) _then;

/// Create a copy of MapTaskCreator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_MapTaskCreator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
