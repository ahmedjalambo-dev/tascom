// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_tasks_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedTasksResponse {

 bool? get success; List<TaskResponseData> get data;
/// Create a copy of SavedTasksResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedTasksResponseCopyWith<SavedTasksResponse> get copyWith => _$SavedTasksResponseCopyWithImpl<SavedTasksResponse>(this as SavedTasksResponse, _$identity);

  /// Serializes this SavedTasksResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SavedTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SavedTasksResponseCopyWith<$Res>  {
  factory $SavedTasksResponseCopyWith(SavedTasksResponse value, $Res Function(SavedTasksResponse) _then) = _$SavedTasksResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, List<TaskResponseData> data
});




}
/// @nodoc
class _$SavedTasksResponseCopyWithImpl<$Res>
    implements $SavedTasksResponseCopyWith<$Res> {
  _$SavedTasksResponseCopyWithImpl(this._self, this._then);

  final SavedTasksResponse _self;
  final $Res Function(SavedTasksResponse) _then;

/// Create a copy of SavedTasksResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TaskResponseData>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedTasksResponse].
extension SavedTasksResponsePatterns on SavedTasksResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedTasksResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedTasksResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedTasksResponse value)  $default,){
final _that = this;
switch (_that) {
case _SavedTasksResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedTasksResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SavedTasksResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  List<TaskResponseData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedTasksResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  List<TaskResponseData> data)  $default,) {final _that = this;
switch (_that) {
case _SavedTasksResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  List<TaskResponseData> data)?  $default,) {final _that = this;
switch (_that) {
case _SavedTasksResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedTasksResponse implements SavedTasksResponse {
  const _SavedTasksResponse({this.success, final  List<TaskResponseData> data = const []}): _data = data;
  factory _SavedTasksResponse.fromJson(Map<String, dynamic> json) => _$SavedTasksResponseFromJson(json);

@override final  bool? success;
 final  List<TaskResponseData> _data;
@override@JsonKey() List<TaskResponseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SavedTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedTasksResponseCopyWith<_SavedTasksResponse> get copyWith => __$SavedTasksResponseCopyWithImpl<_SavedTasksResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedTasksResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedTasksResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SavedTasksResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SavedTasksResponseCopyWith<$Res> implements $SavedTasksResponseCopyWith<$Res> {
  factory _$SavedTasksResponseCopyWith(_SavedTasksResponse value, $Res Function(_SavedTasksResponse) _then) = __$SavedTasksResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, List<TaskResponseData> data
});




}
/// @nodoc
class __$SavedTasksResponseCopyWithImpl<$Res>
    implements _$SavedTasksResponseCopyWith<$Res> {
  __$SavedTasksResponseCopyWithImpl(this._self, this._then);

  final _SavedTasksResponse _self;
  final $Res Function(_SavedTasksResponse) _then;

/// Create a copy of SavedTasksResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? data = null,}) {
  return _then(_SavedTasksResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TaskResponseData>,
  ));
}


}

// dart format on
