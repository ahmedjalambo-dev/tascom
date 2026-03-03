// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_person_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchPersonData {

 String get id; String get name; String? get location;@JsonKey(name: 'ratingAvg') double? get ratingAvg; String? get skills; String? get avatar; double get distance;
/// Create a copy of SearchPersonData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPersonDataCopyWith<SearchPersonData> get copyWith => _$SearchPersonDataCopyWithImpl<SearchPersonData>(this as SearchPersonData, _$identity);

  /// Serializes this SearchPersonData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPersonData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,ratingAvg,skills,avatar,distance);

@override
String toString() {
  return 'SearchPersonData(id: $id, name: $name, location: $location, ratingAvg: $ratingAvg, skills: $skills, avatar: $avatar, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $SearchPersonDataCopyWith<$Res>  {
  factory $SearchPersonDataCopyWith(SearchPersonData value, $Res Function(SearchPersonData) _then) = _$SearchPersonDataCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? location,@JsonKey(name: 'ratingAvg') double? ratingAvg, String? skills, String? avatar, double distance
});




}
/// @nodoc
class _$SearchPersonDataCopyWithImpl<$Res>
    implements $SearchPersonDataCopyWith<$Res> {
  _$SearchPersonDataCopyWithImpl(this._self, this._then);

  final SearchPersonData _self;
  final $Res Function(SearchPersonData) _then;

/// Create a copy of SearchPersonData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = freezed,Object? ratingAvg = freezed,Object? skills = freezed,Object? avatar = freezed,Object? distance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ratingAvg: freezed == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as double?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchPersonData].
extension SearchPersonDataPatterns on SearchPersonData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchPersonData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchPersonData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchPersonData value)  $default,){
final _that = this;
switch (_that) {
case _SearchPersonData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchPersonData value)?  $default,){
final _that = this;
switch (_that) {
case _SearchPersonData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? location, @JsonKey(name: 'ratingAvg')  double? ratingAvg,  String? skills,  String? avatar,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchPersonData() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.ratingAvg,_that.skills,_that.avatar,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? location, @JsonKey(name: 'ratingAvg')  double? ratingAvg,  String? skills,  String? avatar,  double distance)  $default,) {final _that = this;
switch (_that) {
case _SearchPersonData():
return $default(_that.id,_that.name,_that.location,_that.ratingAvg,_that.skills,_that.avatar,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? location, @JsonKey(name: 'ratingAvg')  double? ratingAvg,  String? skills,  String? avatar,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _SearchPersonData() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.ratingAvg,_that.skills,_that.avatar,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchPersonData implements SearchPersonData {
  const _SearchPersonData({required this.id, required this.name, this.location, @JsonKey(name: 'ratingAvg') this.ratingAvg, this.skills, this.avatar, this.distance = 0});
  factory _SearchPersonData.fromJson(Map<String, dynamic> json) => _$SearchPersonDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? location;
@override@JsonKey(name: 'ratingAvg') final  double? ratingAvg;
@override final  String? skills;
@override final  String? avatar;
@override@JsonKey() final  double distance;

/// Create a copy of SearchPersonData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchPersonDataCopyWith<_SearchPersonData> get copyWith => __$SearchPersonDataCopyWithImpl<_SearchPersonData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchPersonDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchPersonData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.ratingAvg, ratingAvg) || other.ratingAvg == ratingAvg)&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,ratingAvg,skills,avatar,distance);

@override
String toString() {
  return 'SearchPersonData(id: $id, name: $name, location: $location, ratingAvg: $ratingAvg, skills: $skills, avatar: $avatar, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$SearchPersonDataCopyWith<$Res> implements $SearchPersonDataCopyWith<$Res> {
  factory _$SearchPersonDataCopyWith(_SearchPersonData value, $Res Function(_SearchPersonData) _then) = __$SearchPersonDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? location,@JsonKey(name: 'ratingAvg') double? ratingAvg, String? skills, String? avatar, double distance
});




}
/// @nodoc
class __$SearchPersonDataCopyWithImpl<$Res>
    implements _$SearchPersonDataCopyWith<$Res> {
  __$SearchPersonDataCopyWithImpl(this._self, this._then);

  final _SearchPersonData _self;
  final $Res Function(_SearchPersonData) _then;

/// Create a copy of SearchPersonData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = freezed,Object? ratingAvg = freezed,Object? skills = freezed,Object? avatar = freezed,Object? distance = null,}) {
  return _then(_SearchPersonData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,ratingAvg: freezed == ratingAvg ? _self.ratingAvg : ratingAvg // ignore: cast_nullable_to_non_nullable
as double?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
