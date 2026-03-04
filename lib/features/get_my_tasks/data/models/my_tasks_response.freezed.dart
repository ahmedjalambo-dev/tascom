// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_tasks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyTasksResponse {

 bool get success; List<MyTaskData> get data;
/// Create a copy of MyTasksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTasksResponseCopyWith<MyTasksResponse> get copyWith => _$MyTasksResponseCopyWithImpl<MyTasksResponse>(this as MyTasksResponse, _$identity);

  /// Serializes this MyTasksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MyTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $MyTasksResponseCopyWith<$Res>  {
  factory $MyTasksResponseCopyWith(MyTasksResponse value, $Res Function(MyTasksResponse) _then) = _$MyTasksResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<MyTaskData> data
});




}
/// @nodoc
class _$MyTasksResponseCopyWithImpl<$Res>
    implements $MyTasksResponseCopyWith<$Res> {
  _$MyTasksResponseCopyWithImpl(this._self, this._then);

  final MyTasksResponse _self;
  final $Res Function(MyTasksResponse) _then;

/// Create a copy of MyTasksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MyTaskData>,
  ));
}

}


/// Adds pattern-matching-related methods to [MyTasksResponse].
extension MyTasksResponsePatterns on MyTasksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTasksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTasksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTasksResponse value)  $default,){
final _that = this;
switch (_that) {
case _MyTasksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTasksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MyTasksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<MyTaskData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTasksResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<MyTaskData> data)  $default,) {final _that = this;
switch (_that) {
case _MyTasksResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<MyTaskData> data)?  $default,) {final _that = this;
switch (_that) {
case _MyTasksResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyTasksResponse implements MyTasksResponse {
  const _MyTasksResponse({required this.success, required final  List<MyTaskData> data}): _data = data;
  factory _MyTasksResponse.fromJson(Map<String, dynamic> json) => _$MyTasksResponseFromJson(json);

@override final  bool success;
 final  List<MyTaskData> _data;
@override List<MyTaskData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of MyTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTasksResponseCopyWith<_MyTasksResponse> get copyWith => __$MyTasksResponseCopyWithImpl<_MyTasksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyTasksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MyTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MyTasksResponseCopyWith<$Res> implements $MyTasksResponseCopyWith<$Res> {
  factory _$MyTasksResponseCopyWith(_MyTasksResponse value, $Res Function(_MyTasksResponse) _then) = __$MyTasksResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<MyTaskData> data
});




}
/// @nodoc
class __$MyTasksResponseCopyWithImpl<$Res>
    implements _$MyTasksResponseCopyWith<$Res> {
  __$MyTasksResponseCopyWithImpl(this._self, this._then);

  final _MyTasksResponse _self;
  final $Res Function(_MyTasksResponse) _then;

/// Create a copy of MyTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_MyTasksResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MyTaskData>,
  ));
}


}


/// @nodoc
mixin _$MyTaskData {

 String get id; String get creatorId; String? get assigneeId; String get title; String get description; double? get latitude; double? get longitude; String? get deadline; int? get pointsOffered; String get status; String get priority; String get category; int? get numOfLikes; String get createdAt; String? get completedAt; String? get updatedAt; bool? get isDeleted; List<ClaimTaskData> get claims;
/// Create a copy of MyTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTaskDataCopyWith<MyTaskData> get copyWith => _$MyTaskDataCopyWithImpl<MyTaskData>(this as MyTaskData, _$identity);

  /// Serializes this MyTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.claims, claims));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(claims));

@override
String toString() {
  return 'MyTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, claims: $claims)';
}


}

/// @nodoc
abstract mixin class $MyTaskDataCopyWith<$Res>  {
  factory $MyTaskDataCopyWith(MyTaskData value, $Res Function(MyTaskData) _then) = _$MyTaskDataCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<ClaimTaskData> claims
});




}
/// @nodoc
class _$MyTaskDataCopyWithImpl<$Res>
    implements $MyTaskDataCopyWith<$Res> {
  _$MyTaskDataCopyWithImpl(this._self, this._then);

  final MyTaskData _self;
  final $Res Function(MyTaskData) _then;

/// Create a copy of MyTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? claims = null,}) {
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
as bool?,claims: null == claims ? _self.claims : claims // ignore: cast_nullable_to_non_nullable
as List<ClaimTaskData>,
  ));
}

}


/// Adds pattern-matching-related methods to [MyTaskData].
extension MyTaskDataPatterns on MyTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTaskData value)  $default,){
final _that = this;
switch (_that) {
case _MyTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _MyTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<ClaimTaskData> claims)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.claims);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<ClaimTaskData> claims)  $default,) {final _that = this;
switch (_that) {
case _MyTaskData():
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.claims);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<ClaimTaskData> claims)?  $default,) {final _that = this;
switch (_that) {
case _MyTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.claims);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyTaskData implements MyTaskData {
  const _MyTaskData({required this.id, required this.creatorId, this.assigneeId, required this.title, required this.description, this.latitude, this.longitude, this.deadline, this.pointsOffered, required this.status, required this.priority, required this.category, this.numOfLikes, required this.createdAt, this.completedAt, this.updatedAt, this.isDeleted, final  List<ClaimTaskData> claims = const []}): _claims = claims;
  factory _MyTaskData.fromJson(Map<String, dynamic> json) => _$MyTaskDataFromJson(json);

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
 final  List<ClaimTaskData> _claims;
@override@JsonKey() List<ClaimTaskData> get claims {
  if (_claims is EqualUnmodifiableListView) return _claims;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_claims);
}


/// Create a copy of MyTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTaskDataCopyWith<_MyTaskData> get copyWith => __$MyTaskDataCopyWithImpl<_MyTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._claims, _claims));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(_claims));

@override
String toString() {
  return 'MyTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, claims: $claims)';
}


}

/// @nodoc
abstract mixin class _$MyTaskDataCopyWith<$Res> implements $MyTaskDataCopyWith<$Res> {
  factory _$MyTaskDataCopyWith(_MyTaskData value, $Res Function(_MyTaskData) _then) = __$MyTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<ClaimTaskData> claims
});




}
/// @nodoc
class __$MyTaskDataCopyWithImpl<$Res>
    implements _$MyTaskDataCopyWith<$Res> {
  __$MyTaskDataCopyWithImpl(this._self, this._then);

  final _MyTaskData _self;
  final $Res Function(_MyTaskData) _then;

/// Create a copy of MyTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? claims = null,}) {
  return _then(_MyTaskData(
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
as bool?,claims: null == claims ? _self._claims : claims // ignore: cast_nullable_to_non_nullable
as List<ClaimTaskData>,
  ));
}


}

// dart format on
