// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchTaskData {

 String get id; String get creatorId; String? get assigneeId; String get title; String get description; double? get latitude; double? get longitude; String? get deadline; int? get pointsOffered; String get status; String get priority; String get category; int? get numOfLikes; String get createdAt; String? get completedAt; String? get updatedAt; bool? get isDeleted; List<SearchTaskAsset> get assets; SearchTaskCreator? get creator; double get distance; bool get isExpired; int get remainingHours; int get remainingDays;
/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTaskDataCopyWith<SearchTaskData> get copyWith => _$SearchTaskDataCopyWithImpl<SearchTaskData>(this as SearchTaskData, _$identity);

  /// Serializes this SearchTaskData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.remainingHours, remainingHours) || other.remainingHours == remainingHours)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(assets),creator,distance,isExpired,remainingHours,remainingDays]);

@override
String toString() {
  return 'SearchTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, assets: $assets, creator: $creator, distance: $distance, isExpired: $isExpired, remainingHours: $remainingHours, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class $SearchTaskDataCopyWith<$Res>  {
  factory $SearchTaskDataCopyWith(SearchTaskData value, $Res Function(SearchTaskData) _then) = _$SearchTaskDataCopyWithImpl;
@useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<SearchTaskAsset> assets, SearchTaskCreator? creator, double distance, bool isExpired, int remainingHours, int remainingDays
});


$SearchTaskCreatorCopyWith<$Res>? get creator;

}
/// @nodoc
class _$SearchTaskDataCopyWithImpl<$Res>
    implements $SearchTaskDataCopyWith<$Res> {
  _$SearchTaskDataCopyWithImpl(this._self, this._then);

  final SearchTaskData _self;
  final $Res Function(SearchTaskData) _then;

/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? assets = null,Object? creator = freezed,Object? distance = null,Object? isExpired = null,Object? remainingHours = null,Object? remainingDays = null,}) {
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
as List<SearchTaskAsset>,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as SearchTaskCreator?,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,remainingHours: null == remainingHours ? _self.remainingHours : remainingHours // ignore: cast_nullable_to_non_nullable
as int,remainingDays: null == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchTaskCreatorCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $SearchTaskCreatorCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchTaskData].
extension SearchTaskDataPatterns on SearchTaskData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchTaskData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchTaskData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchTaskData value)  $default,){
final _that = this;
switch (_that) {
case _SearchTaskData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchTaskData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchTaskData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<SearchTaskAsset> assets,  SearchTaskCreator? creator,  double distance,  bool isExpired,  int remainingHours,  int remainingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchTaskData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<SearchTaskAsset> assets,  SearchTaskCreator? creator,  double distance,  bool isExpired,  int remainingHours,  int remainingDays)  $default,) {final _that = this;
switch (_that) {
case _SearchTaskData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String creatorId,  String? assigneeId,  String title,  String description,  double? latitude,  double? longitude,  String? deadline,  int? pointsOffered,  String status,  String priority,  String category,  int? numOfLikes,  String createdAt,  String? completedAt,  String? updatedAt,  bool? isDeleted,  List<SearchTaskAsset> assets,  SearchTaskCreator? creator,  double distance,  bool isExpired,  int remainingHours,  int remainingDays)?  $default,) {final _that = this;
switch (_that) {
case _SearchTaskData() when $default != null:
return $default(_that.id,_that.creatorId,_that.assigneeId,_that.title,_that.description,_that.latitude,_that.longitude,_that.deadline,_that.pointsOffered,_that.status,_that.priority,_that.category,_that.numOfLikes,_that.createdAt,_that.completedAt,_that.updatedAt,_that.isDeleted,_that.assets,_that.creator,_that.distance,_that.isExpired,_that.remainingHours,_that.remainingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchTaskData implements SearchTaskData {
  const _SearchTaskData({required this.id, required this.creatorId, this.assigneeId, required this.title, required this.description, this.latitude, this.longitude, this.deadline, this.pointsOffered, required this.status, required this.priority, required this.category, this.numOfLikes, required this.createdAt, this.completedAt, this.updatedAt, this.isDeleted, final  List<SearchTaskAsset> assets = const [], this.creator, this.distance = 0, this.isExpired = false, this.remainingHours = 0, this.remainingDays = 0}): _assets = assets;
  factory _SearchTaskData.fromJson(Map<String, dynamic> json) => _$SearchTaskDataFromJson(json);

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
 final  List<SearchTaskAsset> _assets;
@override@JsonKey() List<SearchTaskAsset> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  SearchTaskCreator? creator;
@override@JsonKey() final  double distance;
@override@JsonKey() final  bool isExpired;
@override@JsonKey() final  int remainingHours;
@override@JsonKey() final  int remainingDays;

/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTaskDataCopyWith<_SearchTaskData> get copyWith => __$SearchTaskDataCopyWithImpl<_SearchTaskData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchTaskDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTaskData&&(identical(other.id, id) || other.id == id)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.pointsOffered, pointsOffered) || other.pointsOffered == pointsOffered)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.category, category) || other.category == category)&&(identical(other.numOfLikes, numOfLikes) || other.numOfLikes == numOfLikes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.remainingHours, remainingHours) || other.remainingHours == remainingHours)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creatorId,assigneeId,title,description,latitude,longitude,deadline,pointsOffered,status,priority,category,numOfLikes,createdAt,completedAt,updatedAt,isDeleted,const DeepCollectionEquality().hash(_assets),creator,distance,isExpired,remainingHours,remainingDays]);

@override
String toString() {
  return 'SearchTaskData(id: $id, creatorId: $creatorId, assigneeId: $assigneeId, title: $title, description: $description, latitude: $latitude, longitude: $longitude, deadline: $deadline, pointsOffered: $pointsOffered, status: $status, priority: $priority, category: $category, numOfLikes: $numOfLikes, createdAt: $createdAt, completedAt: $completedAt, updatedAt: $updatedAt, isDeleted: $isDeleted, assets: $assets, creator: $creator, distance: $distance, isExpired: $isExpired, remainingHours: $remainingHours, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class _$SearchTaskDataCopyWith<$Res> implements $SearchTaskDataCopyWith<$Res> {
  factory _$SearchTaskDataCopyWith(_SearchTaskData value, $Res Function(_SearchTaskData) _then) = __$SearchTaskDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String creatorId, String? assigneeId, String title, String description, double? latitude, double? longitude, String? deadline, int? pointsOffered, String status, String priority, String category, int? numOfLikes, String createdAt, String? completedAt, String? updatedAt, bool? isDeleted, List<SearchTaskAsset> assets, SearchTaskCreator? creator, double distance, bool isExpired, int remainingHours, int remainingDays
});


@override $SearchTaskCreatorCopyWith<$Res>? get creator;

}
/// @nodoc
class __$SearchTaskDataCopyWithImpl<$Res>
    implements _$SearchTaskDataCopyWith<$Res> {
  __$SearchTaskDataCopyWithImpl(this._self, this._then);

  final _SearchTaskData _self;
  final $Res Function(_SearchTaskData) _then;

/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creatorId = null,Object? assigneeId = freezed,Object? title = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? deadline = freezed,Object? pointsOffered = freezed,Object? status = null,Object? priority = null,Object? category = null,Object? numOfLikes = freezed,Object? createdAt = null,Object? completedAt = freezed,Object? updatedAt = freezed,Object? isDeleted = freezed,Object? assets = null,Object? creator = freezed,Object? distance = null,Object? isExpired = null,Object? remainingHours = null,Object? remainingDays = null,}) {
  return _then(_SearchTaskData(
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
as List<SearchTaskAsset>,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as SearchTaskCreator?,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isExpired: null == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool,remainingHours: null == remainingHours ? _self.remainingHours : remainingHours // ignore: cast_nullable_to_non_nullable
as int,remainingDays: null == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SearchTaskData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchTaskCreatorCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $SearchTaskCreatorCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// @nodoc
mixin _$SearchTaskCreator {

 String get id; String get name;
/// Create a copy of SearchTaskCreator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTaskCreatorCopyWith<SearchTaskCreator> get copyWith => _$SearchTaskCreatorCopyWithImpl<SearchTaskCreator>(this as SearchTaskCreator, _$identity);

  /// Serializes this SearchTaskCreator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTaskCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchTaskCreator(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SearchTaskCreatorCopyWith<$Res>  {
  factory $SearchTaskCreatorCopyWith(SearchTaskCreator value, $Res Function(SearchTaskCreator) _then) = _$SearchTaskCreatorCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$SearchTaskCreatorCopyWithImpl<$Res>
    implements $SearchTaskCreatorCopyWith<$Res> {
  _$SearchTaskCreatorCopyWithImpl(this._self, this._then);

  final SearchTaskCreator _self;
  final $Res Function(SearchTaskCreator) _then;

/// Create a copy of SearchTaskCreator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchTaskCreator].
extension SearchTaskCreatorPatterns on SearchTaskCreator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchTaskCreator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchTaskCreator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchTaskCreator value)  $default,){
final _that = this;
switch (_that) {
case _SearchTaskCreator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchTaskCreator value)?  $default,){
final _that = this;
switch (_that) {
case _SearchTaskCreator() when $default != null:
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
case _SearchTaskCreator() when $default != null:
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
case _SearchTaskCreator():
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
case _SearchTaskCreator() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchTaskCreator implements SearchTaskCreator {
  const _SearchTaskCreator({required this.id, required this.name});
  factory _SearchTaskCreator.fromJson(Map<String, dynamic> json) => _$SearchTaskCreatorFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of SearchTaskCreator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTaskCreatorCopyWith<_SearchTaskCreator> get copyWith => __$SearchTaskCreatorCopyWithImpl<_SearchTaskCreator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchTaskCreatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTaskCreator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchTaskCreator(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SearchTaskCreatorCopyWith<$Res> implements $SearchTaskCreatorCopyWith<$Res> {
  factory _$SearchTaskCreatorCopyWith(_SearchTaskCreator value, $Res Function(_SearchTaskCreator) _then) = __$SearchTaskCreatorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$SearchTaskCreatorCopyWithImpl<$Res>
    implements _$SearchTaskCreatorCopyWith<$Res> {
  __$SearchTaskCreatorCopyWithImpl(this._self, this._then);

  final _SearchTaskCreator _self;
  final $Res Function(_SearchTaskCreator) _then;

/// Create a copy of SearchTaskCreator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SearchTaskCreator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchTaskAsset {

 String? get id; String? get url;
/// Create a copy of SearchTaskAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTaskAssetCopyWith<SearchTaskAsset> get copyWith => _$SearchTaskAssetCopyWithImpl<SearchTaskAsset>(this as SearchTaskAsset, _$identity);

  /// Serializes this SearchTaskAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTaskAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'SearchTaskAsset(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $SearchTaskAssetCopyWith<$Res>  {
  factory $SearchTaskAssetCopyWith(SearchTaskAsset value, $Res Function(SearchTaskAsset) _then) = _$SearchTaskAssetCopyWithImpl;
@useResult
$Res call({
 String? id, String? url
});




}
/// @nodoc
class _$SearchTaskAssetCopyWithImpl<$Res>
    implements $SearchTaskAssetCopyWith<$Res> {
  _$SearchTaskAssetCopyWithImpl(this._self, this._then);

  final SearchTaskAsset _self;
  final $Res Function(SearchTaskAsset) _then;

/// Create a copy of SearchTaskAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchTaskAsset].
extension SearchTaskAssetPatterns on SearchTaskAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchTaskAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchTaskAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchTaskAsset value)  $default,){
final _that = this;
switch (_that) {
case _SearchTaskAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchTaskAsset value)?  $default,){
final _that = this;
switch (_that) {
case _SearchTaskAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchTaskAsset() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? url)  $default,) {final _that = this;
switch (_that) {
case _SearchTaskAsset():
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _SearchTaskAsset() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchTaskAsset implements SearchTaskAsset {
  const _SearchTaskAsset({this.id, this.url});
  factory _SearchTaskAsset.fromJson(Map<String, dynamic> json) => _$SearchTaskAssetFromJson(json);

@override final  String? id;
@override final  String? url;

/// Create a copy of SearchTaskAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTaskAssetCopyWith<_SearchTaskAsset> get copyWith => __$SearchTaskAssetCopyWithImpl<_SearchTaskAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchTaskAssetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchTaskAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'SearchTaskAsset(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SearchTaskAssetCopyWith<$Res> implements $SearchTaskAssetCopyWith<$Res> {
  factory _$SearchTaskAssetCopyWith(_SearchTaskAsset value, $Res Function(_SearchTaskAsset) _then) = __$SearchTaskAssetCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? url
});




}
/// @nodoc
class __$SearchTaskAssetCopyWithImpl<$Res>
    implements _$SearchTaskAssetCopyWith<$Res> {
  __$SearchTaskAssetCopyWithImpl(this._self, this._then);

  final _SearchTaskAsset _self;
  final $Res Function(_SearchTaskAsset) _then;

/// Create a copy of SearchTaskAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? url = freezed,}) {
  return _then(_SearchTaskAsset(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
