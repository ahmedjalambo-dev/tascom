// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetTasksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTasksState()';
}


}

/// @nodoc
class $GetTasksStateCopyWith<$Res>  {
$GetTasksStateCopyWith(GetTasksState _, $Res Function(GetTasksState) __);
}


/// Adds pattern-matching-related methods to [GetTasksState].
extension GetTasksStatePatterns on GetTasksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetTasksInitial value)?  initial,TResult Function( GetTasksLoading value)?  loading,TResult Function( GetTasksSuccess value)?  success,TResult Function( GetTasksLoadingMore value)?  loadingMore,TResult Function( GetTasksError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetTasksInitial() when initial != null:
return initial(_that);case GetTasksLoading() when loading != null:
return loading(_that);case GetTasksSuccess() when success != null:
return success(_that);case GetTasksLoadingMore() when loadingMore != null:
return loadingMore(_that);case GetTasksError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetTasksInitial value)  initial,required TResult Function( GetTasksLoading value)  loading,required TResult Function( GetTasksSuccess value)  success,required TResult Function( GetTasksLoadingMore value)  loadingMore,required TResult Function( GetTasksError value)  error,}){
final _that = this;
switch (_that) {
case GetTasksInitial():
return initial(_that);case GetTasksLoading():
return loading(_that);case GetTasksSuccess():
return success(_that);case GetTasksLoadingMore():
return loadingMore(_that);case GetTasksError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetTasksInitial value)?  initial,TResult? Function( GetTasksLoading value)?  loading,TResult? Function( GetTasksSuccess value)?  success,TResult? Function( GetTasksLoadingMore value)?  loadingMore,TResult? Function( GetTasksError value)?  error,}){
final _that = this;
switch (_that) {
case GetTasksInitial() when initial != null:
return initial(_that);case GetTasksLoading() when loading != null:
return loading(_that);case GetTasksSuccess() when success != null:
return success(_that);case GetTasksLoadingMore() when loadingMore != null:
return loadingMore(_that);case GetTasksError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  success,TResult Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  loadingMore,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetTasksInitial() when initial != null:
return initial();case GetTasksLoading() when loading != null:
return loading();case GetTasksSuccess() when success != null:
return success(_that.response,_that.creators,_that.locationNames);case GetTasksLoadingMore() when loadingMore != null:
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case GetTasksError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)  success,required TResult Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)  loadingMore,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case GetTasksInitial():
return initial();case GetTasksLoading():
return loading();case GetTasksSuccess():
return success(_that.response,_that.creators,_that.locationNames);case GetTasksLoadingMore():
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case GetTasksError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  success,TResult? Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  loadingMore,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case GetTasksInitial() when initial != null:
return initial();case GetTasksLoading() when loading != null:
return loading();case GetTasksSuccess() when success != null:
return success(_that.response,_that.creators,_that.locationNames);case GetTasksLoadingMore() when loadingMore != null:
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case GetTasksError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class GetTasksInitial implements GetTasksState {
  const GetTasksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTasksState.initial()';
}


}




/// @nodoc


class GetTasksLoading implements GetTasksState {
  const GetTasksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTasksState.loading()';
}


}




/// @nodoc


class GetTasksSuccess implements GetTasksState {
  const GetTasksSuccess({required this.response, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

 final  AllTasksResponse response;
 final  Map<String, UserModel> _creators;
 Map<String, UserModel> get creators {
  if (_creators is EqualUnmodifiableMapView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creators);
}

 final  Map<String, String> _locationNames;
 Map<String, String> get locationNames {
  if (_locationNames is EqualUnmodifiableMapView) return _locationNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_locationNames);
}


/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTasksSuccessCopyWith<GetTasksSuccess> get copyWith => _$GetTasksSuccessCopyWithImpl<GetTasksSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksSuccess&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,response,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'GetTasksState.success(response: $response, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $GetTasksSuccessCopyWith<$Res> implements $GetTasksStateCopyWith<$Res> {
  factory $GetTasksSuccessCopyWith(GetTasksSuccess value, $Res Function(GetTasksSuccess) _then) = _$GetTasksSuccessCopyWithImpl;
@useResult
$Res call({
 AllTasksResponse response, Map<String, UserModel> creators, Map<String, String> locationNames
});


$AllTasksResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$GetTasksSuccessCopyWithImpl<$Res>
    implements $GetTasksSuccessCopyWith<$Res> {
  _$GetTasksSuccessCopyWithImpl(this._self, this._then);

  final GetTasksSuccess _self;
  final $Res Function(GetTasksSuccess) _then;

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(GetTasksSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AllTasksResponseCopyWith<$Res> get response {
  
  return $AllTasksResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

/// @nodoc


class GetTasksLoadingMore implements GetTasksState {
  const GetTasksLoadingMore({required this.currentData, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

 final  AllTasksResponse currentData;
 final  Map<String, UserModel> _creators;
 Map<String, UserModel> get creators {
  if (_creators is EqualUnmodifiableMapView) return _creators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_creators);
}

 final  Map<String, String> _locationNames;
 Map<String, String> get locationNames {
  if (_locationNames is EqualUnmodifiableMapView) return _locationNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_locationNames);
}


/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTasksLoadingMoreCopyWith<GetTasksLoadingMore> get copyWith => _$GetTasksLoadingMoreCopyWithImpl<GetTasksLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksLoadingMore&&(identical(other.currentData, currentData) || other.currentData == currentData)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,currentData,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'GetTasksState.loadingMore(currentData: $currentData, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $GetTasksLoadingMoreCopyWith<$Res> implements $GetTasksStateCopyWith<$Res> {
  factory $GetTasksLoadingMoreCopyWith(GetTasksLoadingMore value, $Res Function(GetTasksLoadingMore) _then) = _$GetTasksLoadingMoreCopyWithImpl;
@useResult
$Res call({
 AllTasksResponse currentData, Map<String, UserModel> creators, Map<String, String> locationNames
});


$AllTasksResponseCopyWith<$Res> get currentData;

}
/// @nodoc
class _$GetTasksLoadingMoreCopyWithImpl<$Res>
    implements $GetTasksLoadingMoreCopyWith<$Res> {
  _$GetTasksLoadingMoreCopyWithImpl(this._self, this._then);

  final GetTasksLoadingMore _self;
  final $Res Function(GetTasksLoadingMore) _then;

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentData = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(GetTasksLoadingMore(
currentData: null == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AllTasksResponseCopyWith<$Res> get currentData {
  
  return $AllTasksResponseCopyWith<$Res>(_self.currentData, (value) {
    return _then(_self.copyWith(currentData: value));
  });
}
}

/// @nodoc


class GetTasksError implements GetTasksState {
  const GetTasksError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTasksErrorCopyWith<GetTasksError> get copyWith => _$GetTasksErrorCopyWithImpl<GetTasksError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTasksError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetTasksState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $GetTasksErrorCopyWith<$Res> implements $GetTasksStateCopyWith<$Res> {
  factory $GetTasksErrorCopyWith(GetTasksError value, $Res Function(GetTasksError) _then) = _$GetTasksErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});


$ApiErrorModelCopyWith<$Res> get error;

}
/// @nodoc
class _$GetTasksErrorCopyWithImpl<$Res>
    implements $GetTasksErrorCopyWith<$Res> {
  _$GetTasksErrorCopyWithImpl(this._self, this._then);

  final GetTasksError _self;
  final $Res Function(GetTasksError) _then;

/// Create a copy of GetTasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GetTasksError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

/// Create a copy of GetTasksState
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
