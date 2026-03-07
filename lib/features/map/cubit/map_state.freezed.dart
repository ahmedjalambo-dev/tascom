// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState()';
}


}

/// @nodoc
class $MapStateCopyWith<$Res>  {
$MapStateCopyWith(MapState _, $Res Function(MapState) __);
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MapInitial value)?  initial,TResult Function( MapLoading value)?  loading,TResult Function( MapSuccess value)?  success,TResult Function( MapError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MapInitial() when initial != null:
return initial(_that);case MapLoading() when loading != null:
return loading(_that);case MapSuccess() when success != null:
return success(_that);case MapError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MapInitial value)  initial,required TResult Function( MapLoading value)  loading,required TResult Function( MapSuccess value)  success,required TResult Function( MapError value)  error,}){
final _that = this;
switch (_that) {
case MapInitial():
return initial(_that);case MapLoading():
return loading(_that);case MapSuccess():
return success(_that);case MapError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MapInitial value)?  initial,TResult? Function( MapLoading value)?  loading,TResult? Function( MapSuccess value)?  success,TResult? Function( MapError value)?  error,}){
final _that = this;
switch (_that) {
case MapInitial() when initial != null:
return initial(_that);case MapLoading() when loading != null:
return loading(_that);case MapSuccess() when success != null:
return success(_that);case MapError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( MapTasksResponse response)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MapInitial() when initial != null:
return initial();case MapLoading() when loading != null:
return loading();case MapSuccess() when success != null:
return success(_that.response);case MapError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( MapTasksResponse response)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case MapInitial():
return initial();case MapLoading():
return loading();case MapSuccess():
return success(_that.response);case MapError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( MapTasksResponse response)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case MapInitial() when initial != null:
return initial();case MapLoading() when loading != null:
return loading();case MapSuccess() when success != null:
return success(_that.response);case MapError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MapInitial implements MapState {
  const MapInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.initial()';
}


}




/// @nodoc


class MapLoading implements MapState {
  const MapLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.loading()';
}


}




/// @nodoc


class MapSuccess implements MapState {
  const MapSuccess(this.response);
  

 final  MapTasksResponse response;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapSuccessCopyWith<MapSuccess> get copyWith => _$MapSuccessCopyWithImpl<MapSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'MapState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $MapSuccessCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $MapSuccessCopyWith(MapSuccess value, $Res Function(MapSuccess) _then) = _$MapSuccessCopyWithImpl;
@useResult
$Res call({
 MapTasksResponse response
});


$MapTasksResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$MapSuccessCopyWithImpl<$Res>
    implements $MapSuccessCopyWith<$Res> {
  _$MapSuccessCopyWithImpl(this._self, this._then);

  final MapSuccess _self;
  final $Res Function(MapSuccess) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(MapSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as MapTasksResponse,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapTasksResponseCopyWith<$Res> get response {
  
  return $MapTasksResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

/// @nodoc


class MapError implements MapState {
  const MapError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapErrorCopyWith<MapError> get copyWith => _$MapErrorCopyWithImpl<MapError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MapState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $MapErrorCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $MapErrorCopyWith(MapError value, $Res Function(MapError) _then) = _$MapErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});


$ApiErrorModelCopyWith<$Res> get error;

}
/// @nodoc
class _$MapErrorCopyWithImpl<$Res>
    implements $MapErrorCopyWith<$Res> {
  _$MapErrorCopyWithImpl(this._self, this._then);

  final MapError _self;
  final $Res Function(MapError) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MapError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorModelCopyWith<$Res> get error {
  
  return $ApiErrorModelCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
