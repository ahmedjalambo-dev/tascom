// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get name; String get email; String? get phoneNumber; String? get location; String? get about; List<String>? get skills;@JsonKey(name: 'DOB') DateTime? get dateOfBirth; String? get gender; String? get avatar; double? get rating; int? get reviewCount; int? get points; int? get postedCount; int? get claimedCount; int? get completedCount;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.location, location) || other.location == location)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.points, points) || other.points == points)&&(identical(other.postedCount, postedCount) || other.postedCount == postedCount)&&(identical(other.claimedCount, claimedCount) || other.claimedCount == claimedCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phoneNumber,location,about,const DeepCollectionEquality().hash(skills),dateOfBirth,gender,avatar,rating,reviewCount,points,postedCount,claimedCount,completedCount);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, location: $location, about: $about, skills: $skills, dateOfBirth: $dateOfBirth, gender: $gender, avatar: $avatar, rating: $rating, reviewCount: $reviewCount, points: $points, postedCount: $postedCount, claimedCount: $claimedCount, completedCount: $completedCount)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String? phoneNumber, String? location, String? about, List<String>? skills,@JsonKey(name: 'DOB') DateTime? dateOfBirth, String? gender, String? avatar, double? rating, int? reviewCount, int? points, int? postedCount, int? claimedCount, int? completedCount
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phoneNumber = freezed,Object? location = freezed,Object? about = freezed,Object? skills = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? avatar = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? points = freezed,Object? postedCount = freezed,Object? claimedCount = freezed,Object? completedCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,postedCount: freezed == postedCount ? _self.postedCount : postedCount // ignore: cast_nullable_to_non_nullable
as int?,claimedCount: freezed == claimedCount ? _self.claimedCount : claimedCount // ignore: cast_nullable_to_non_nullable
as int?,completedCount: freezed == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phoneNumber,  String? location,  String? about,  List<String>? skills, @JsonKey(name: 'DOB')  DateTime? dateOfBirth,  String? gender,  String? avatar,  double? rating,  int? reviewCount,  int? points,  int? postedCount,  int? claimedCount,  int? completedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phoneNumber,_that.location,_that.about,_that.skills,_that.dateOfBirth,_that.gender,_that.avatar,_that.rating,_that.reviewCount,_that.points,_that.postedCount,_that.claimedCount,_that.completedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? phoneNumber,  String? location,  String? about,  List<String>? skills, @JsonKey(name: 'DOB')  DateTime? dateOfBirth,  String? gender,  String? avatar,  double? rating,  int? reviewCount,  int? points,  int? postedCount,  int? claimedCount,  int? completedCount)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.name,_that.email,_that.phoneNumber,_that.location,_that.about,_that.skills,_that.dateOfBirth,_that.gender,_that.avatar,_that.rating,_that.reviewCount,_that.points,_that.postedCount,_that.claimedCount,_that.completedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String? phoneNumber,  String? location,  String? about,  List<String>? skills, @JsonKey(name: 'DOB')  DateTime? dateOfBirth,  String? gender,  String? avatar,  double? rating,  int? reviewCount,  int? points,  int? postedCount,  int? claimedCount,  int? completedCount)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phoneNumber,_that.location,_that.about,_that.skills,_that.dateOfBirth,_that.gender,_that.avatar,_that.rating,_that.reviewCount,_that.points,_that.postedCount,_that.claimedCount,_that.completedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.name, required this.email, this.phoneNumber, this.location, this.about, final  List<String>? skills, @JsonKey(name: 'DOB') this.dateOfBirth, this.gender, this.avatar, this.rating, this.reviewCount, this.points, this.postedCount, this.claimedCount, this.completedCount}): _skills = skills;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String? phoneNumber;
@override final  String? location;
@override final  String? about;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'DOB') final  DateTime? dateOfBirth;
@override final  String? gender;
@override final  String? avatar;
@override final  double? rating;
@override final  int? reviewCount;
@override final  int? points;
@override final  int? postedCount;
@override final  int? claimedCount;
@override final  int? completedCount;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.location, location) || other.location == location)&&(identical(other.about, about) || other.about == about)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.points, points) || other.points == points)&&(identical(other.postedCount, postedCount) || other.postedCount == postedCount)&&(identical(other.claimedCount, claimedCount) || other.claimedCount == claimedCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phoneNumber,location,about,const DeepCollectionEquality().hash(_skills),dateOfBirth,gender,avatar,rating,reviewCount,points,postedCount,claimedCount,completedCount);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, location: $location, about: $about, skills: $skills, dateOfBirth: $dateOfBirth, gender: $gender, avatar: $avatar, rating: $rating, reviewCount: $reviewCount, points: $points, postedCount: $postedCount, claimedCount: $claimedCount, completedCount: $completedCount)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String? phoneNumber, String? location, String? about, List<String>? skills,@JsonKey(name: 'DOB') DateTime? dateOfBirth, String? gender, String? avatar, double? rating, int? reviewCount, int? points, int? postedCount, int? claimedCount, int? completedCount
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phoneNumber = freezed,Object? location = freezed,Object? about = freezed,Object? skills = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? avatar = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? points = freezed,Object? postedCount = freezed,Object? claimedCount = freezed,Object? completedCount = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,points: freezed == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int?,postedCount: freezed == postedCount ? _self.postedCount : postedCount // ignore: cast_nullable_to_non_nullable
as int?,claimedCount: freezed == claimedCount ? _self.claimedCount : claimedCount // ignore: cast_nullable_to_non_nullable
as int?,completedCount: freezed == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
