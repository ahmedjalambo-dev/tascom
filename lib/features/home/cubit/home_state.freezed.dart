// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeInitial value)?  initial,TResult Function( HomeLoading value)?  loading,TResult Function( HomeSuccess value)?  success,TResult Function( HomeLoadingMore value)?  loadingMore,TResult Function( HomeError value)?  error,TResult Function( HomeClaimLoading value)?  claimLoading,TResult Function( HomeClaimError value)?  claimError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeSuccess() when success != null:
return success(_that);case HomeLoadingMore() when loadingMore != null:
return loadingMore(_that);case HomeError() when error != null:
return error(_that);case HomeClaimLoading() when claimLoading != null:
return claimLoading(_that);case HomeClaimError() when claimError != null:
return claimError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeInitial value)  initial,required TResult Function( HomeLoading value)  loading,required TResult Function( HomeSuccess value)  success,required TResult Function( HomeLoadingMore value)  loadingMore,required TResult Function( HomeError value)  error,required TResult Function( HomeClaimLoading value)  claimLoading,required TResult Function( HomeClaimError value)  claimError,}){
final _that = this;
switch (_that) {
case HomeInitial():
return initial(_that);case HomeLoading():
return loading(_that);case HomeSuccess():
return success(_that);case HomeLoadingMore():
return loadingMore(_that);case HomeError():
return error(_that);case HomeClaimLoading():
return claimLoading(_that);case HomeClaimError():
return claimError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeInitial value)?  initial,TResult? Function( HomeLoading value)?  loading,TResult? Function( HomeSuccess value)?  success,TResult? Function( HomeLoadingMore value)?  loadingMore,TResult? Function( HomeError value)?  error,TResult? Function( HomeClaimLoading value)?  claimLoading,TResult? Function( HomeClaimError value)?  claimError,}){
final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeSuccess() when success != null:
return success(_that);case HomeLoadingMore() when loadingMore != null:
return loadingMore(_that);case HomeError() when error != null:
return error(_that);case HomeClaimLoading() when claimLoading != null:
return claimLoading(_that);case HomeClaimError() when claimError != null:
return claimError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  success,TResult Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  loadingMore,TResult Function( ApiErrorModel error)?  error,TResult Function( String taskId,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  claimLoading,TResult Function( ApiErrorModel error,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  claimError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading();case HomeSuccess() when success != null:
return success(_that.response,_that.creators,_that.locationNames);case HomeLoadingMore() when loadingMore != null:
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case HomeError() when error != null:
return error(_that.error);case HomeClaimLoading() when claimLoading != null:
return claimLoading(_that.taskId,_that.currentData,_that.creators,_that.locationNames);case HomeClaimError() when claimError != null:
return claimError(_that.error,_that.currentData,_that.creators,_that.locationNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)  success,required TResult Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)  loadingMore,required TResult Function( ApiErrorModel error)  error,required TResult Function( String taskId,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)  claimLoading,required TResult Function( ApiErrorModel error,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)  claimError,}) {final _that = this;
switch (_that) {
case HomeInitial():
return initial();case HomeLoading():
return loading();case HomeSuccess():
return success(_that.response,_that.creators,_that.locationNames);case HomeLoadingMore():
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case HomeError():
return error(_that.error);case HomeClaimLoading():
return claimLoading(_that.taskId,_that.currentData,_that.creators,_that.locationNames);case HomeClaimError():
return claimError(_that.error,_that.currentData,_that.creators,_that.locationNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AllTasksResponse response,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  success,TResult? Function( AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  loadingMore,TResult? Function( ApiErrorModel error)?  error,TResult? Function( String taskId,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  claimLoading,TResult? Function( ApiErrorModel error,  AllTasksResponse currentData,  Map<String, UserModel> creators,  Map<String, String> locationNames)?  claimError,}) {final _that = this;
switch (_that) {
case HomeInitial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading();case HomeSuccess() when success != null:
return success(_that.response,_that.creators,_that.locationNames);case HomeLoadingMore() when loadingMore != null:
return loadingMore(_that.currentData,_that.creators,_that.locationNames);case HomeError() when error != null:
return error(_that.error);case HomeClaimLoading() when claimLoading != null:
return claimLoading(_that.taskId,_that.currentData,_that.creators,_that.locationNames);case HomeClaimError() when claimError != null:
return claimError(_that.error,_that.currentData,_that.creators,_that.locationNames);case _:
  return null;

}
}

}

/// @nodoc


class HomeInitial implements HomeState {
  const HomeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class HomeLoading implements HomeState {
  const HomeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class HomeSuccess implements HomeState {
  const HomeSuccess({required this.response, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSuccessCopyWith<HomeSuccess> get copyWith => _$HomeSuccessCopyWithImpl<HomeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSuccess&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,response,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'HomeState.success(response: $response, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $HomeSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeSuccessCopyWith(HomeSuccess value, $Res Function(HomeSuccess) _then) = _$HomeSuccessCopyWithImpl;
@useResult
$Res call({
 AllTasksResponse response, Map<String, UserModel> creators, Map<String, String> locationNames
});


$AllTasksResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$HomeSuccessCopyWithImpl<$Res>
    implements $HomeSuccessCopyWith<$Res> {
  _$HomeSuccessCopyWithImpl(this._self, this._then);

  final HomeSuccess _self;
  final $Res Function(HomeSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(HomeSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of HomeState
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


class HomeLoadingMore implements HomeState {
  const HomeLoadingMore({required this.currentData, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeLoadingMoreCopyWith<HomeLoadingMore> get copyWith => _$HomeLoadingMoreCopyWithImpl<HomeLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoadingMore&&(identical(other.currentData, currentData) || other.currentData == currentData)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,currentData,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'HomeState.loadingMore(currentData: $currentData, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $HomeLoadingMoreCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeLoadingMoreCopyWith(HomeLoadingMore value, $Res Function(HomeLoadingMore) _then) = _$HomeLoadingMoreCopyWithImpl;
@useResult
$Res call({
 AllTasksResponse currentData, Map<String, UserModel> creators, Map<String, String> locationNames
});


$AllTasksResponseCopyWith<$Res> get currentData;

}
/// @nodoc
class _$HomeLoadingMoreCopyWithImpl<$Res>
    implements $HomeLoadingMoreCopyWith<$Res> {
  _$HomeLoadingMoreCopyWithImpl(this._self, this._then);

  final HomeLoadingMore _self;
  final $Res Function(HomeLoadingMore) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentData = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(HomeLoadingMore(
currentData: null == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of HomeState
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


class HomeError implements HomeState {
  const HomeError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeErrorCopyWith<HomeError> get copyWith => _$HomeErrorCopyWithImpl<HomeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'HomeState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeErrorCopyWith(HomeError value, $Res Function(HomeError) _then) = _$HomeErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});


$ApiErrorModelCopyWith<$Res> get error;

}
/// @nodoc
class _$HomeErrorCopyWithImpl<$Res>
    implements $HomeErrorCopyWith<$Res> {
  _$HomeErrorCopyWithImpl(this._self, this._then);

  final HomeError _self;
  final $Res Function(HomeError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HomeError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorModelCopyWith<$Res> get error {
  
  return $ApiErrorModelCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc


class HomeClaimLoading implements HomeState {
  const HomeClaimLoading({required this.taskId, required this.currentData, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

 final  String taskId;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeClaimLoadingCopyWith<HomeClaimLoading> get copyWith => _$HomeClaimLoadingCopyWithImpl<HomeClaimLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeClaimLoading&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.currentData, currentData) || other.currentData == currentData)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,taskId,currentData,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'HomeState.claimLoading(taskId: $taskId, currentData: $currentData, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $HomeClaimLoadingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeClaimLoadingCopyWith(HomeClaimLoading value, $Res Function(HomeClaimLoading) _then) = _$HomeClaimLoadingCopyWithImpl;
@useResult
$Res call({
 String taskId, AllTasksResponse currentData, Map<String, UserModel> creators, Map<String, String> locationNames
});


$AllTasksResponseCopyWith<$Res> get currentData;

}
/// @nodoc
class _$HomeClaimLoadingCopyWithImpl<$Res>
    implements $HomeClaimLoadingCopyWith<$Res> {
  _$HomeClaimLoadingCopyWithImpl(this._self, this._then);

  final HomeClaimLoading _self;
  final $Res Function(HomeClaimLoading) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? currentData = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(HomeClaimLoading(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,currentData: null == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of HomeState
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


class HomeClaimError implements HomeState {
  const HomeClaimError({required this.error, required this.currentData, required final  Map<String, UserModel> creators, required final  Map<String, String> locationNames}): _creators = creators,_locationNames = locationNames;
  

 final  ApiErrorModel error;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeClaimErrorCopyWith<HomeClaimError> get copyWith => _$HomeClaimErrorCopyWithImpl<HomeClaimError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeClaimError&&(identical(other.error, error) || other.error == error)&&(identical(other.currentData, currentData) || other.currentData == currentData)&&const DeepCollectionEquality().equals(other._creators, _creators)&&const DeepCollectionEquality().equals(other._locationNames, _locationNames));
}


@override
int get hashCode => Object.hash(runtimeType,error,currentData,const DeepCollectionEquality().hash(_creators),const DeepCollectionEquality().hash(_locationNames));

@override
String toString() {
  return 'HomeState.claimError(error: $error, currentData: $currentData, creators: $creators, locationNames: $locationNames)';
}


}

/// @nodoc
abstract mixin class $HomeClaimErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeClaimErrorCopyWith(HomeClaimError value, $Res Function(HomeClaimError) _then) = _$HomeClaimErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error, AllTasksResponse currentData, Map<String, UserModel> creators, Map<String, String> locationNames
});


$ApiErrorModelCopyWith<$Res> get error;$AllTasksResponseCopyWith<$Res> get currentData;

}
/// @nodoc
class _$HomeClaimErrorCopyWithImpl<$Res>
    implements $HomeClaimErrorCopyWith<$Res> {
  _$HomeClaimErrorCopyWithImpl(this._self, this._then);

  final HomeClaimError _self;
  final $Res Function(HomeClaimError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? currentData = null,Object? creators = null,Object? locationNames = null,}) {
  return _then(HomeClaimError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,currentData: null == currentData ? _self.currentData : currentData // ignore: cast_nullable_to_non_nullable
as AllTasksResponse,creators: null == creators ? _self._creators : creators // ignore: cast_nullable_to_non_nullable
as Map<String, UserModel>,locationNames: null == locationNames ? _self._locationNames : locationNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiErrorModelCopyWith<$Res> get error {
  
  return $ApiErrorModelCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AllTasksResponseCopyWith<$Res> get currentData {
  
  return $AllTasksResponseCopyWith<$Res>(_self.currentData, (value) {
    return _then(_self.copyWith(currentData: value));
  });
}
}

// dart format on
