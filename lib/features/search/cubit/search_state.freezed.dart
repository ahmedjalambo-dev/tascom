// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchInitial value)?  initial,TResult Function( SearchLoading value)?  loading,TResult Function( SearchTasksSuccess value)?  tasksSuccess,TResult Function( SearchPeopleSuccess value)?  peopleSuccess,TResult Function( SearchLoadingMore value)?  loadingMore,TResult Function( SearchEmpty value)?  empty,TResult Function( SearchError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchTasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that);case SearchPeopleSuccess() when peopleSuccess != null:
return peopleSuccess(_that);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that);case SearchEmpty() when empty != null:
return empty(_that);case SearchError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchInitial value)  initial,required TResult Function( SearchLoading value)  loading,required TResult Function( SearchTasksSuccess value)  tasksSuccess,required TResult Function( SearchPeopleSuccess value)  peopleSuccess,required TResult Function( SearchLoadingMore value)  loadingMore,required TResult Function( SearchEmpty value)  empty,required TResult Function( SearchError value)  error,}){
final _that = this;
switch (_that) {
case SearchInitial():
return initial(_that);case SearchLoading():
return loading(_that);case SearchTasksSuccess():
return tasksSuccess(_that);case SearchPeopleSuccess():
return peopleSuccess(_that);case SearchLoadingMore():
return loadingMore(_that);case SearchEmpty():
return empty(_that);case SearchError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchInitial value)?  initial,TResult? Function( SearchLoading value)?  loading,TResult? Function( SearchTasksSuccess value)?  tasksSuccess,TResult? Function( SearchPeopleSuccess value)?  peopleSuccess,TResult? Function( SearchLoadingMore value)?  loadingMore,TResult? Function( SearchEmpty value)?  empty,TResult? Function( SearchError value)?  error,}){
final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchTasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that);case SearchPeopleSuccess() when peopleSuccess != null:
return peopleSuccess(_that);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that);case SearchEmpty() when empty != null:
return empty(_that);case SearchError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TaskResponseData> tasks,  SearchMeta meta)?  tasksSuccess,TResult Function( List<SearchPersonData> people,  SearchMeta meta)?  peopleSuccess,TResult Function( List<dynamic> currentItems,  SearchMeta meta)?  loadingMore,TResult Function()?  empty,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchTasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that.tasks,_that.meta);case SearchPeopleSuccess() when peopleSuccess != null:
return peopleSuccess(_that.people,_that.meta);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that.currentItems,_that.meta);case SearchEmpty() when empty != null:
return empty();case SearchError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TaskResponseData> tasks,  SearchMeta meta)  tasksSuccess,required TResult Function( List<SearchPersonData> people,  SearchMeta meta)  peopleSuccess,required TResult Function( List<dynamic> currentItems,  SearchMeta meta)  loadingMore,required TResult Function()  empty,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case SearchInitial():
return initial();case SearchLoading():
return loading();case SearchTasksSuccess():
return tasksSuccess(_that.tasks,_that.meta);case SearchPeopleSuccess():
return peopleSuccess(_that.people,_that.meta);case SearchLoadingMore():
return loadingMore(_that.currentItems,_that.meta);case SearchEmpty():
return empty();case SearchError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TaskResponseData> tasks,  SearchMeta meta)?  tasksSuccess,TResult? Function( List<SearchPersonData> people,  SearchMeta meta)?  peopleSuccess,TResult? Function( List<dynamic> currentItems,  SearchMeta meta)?  loadingMore,TResult? Function()?  empty,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case SearchInitial() when initial != null:
return initial();case SearchLoading() when loading != null:
return loading();case SearchTasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that.tasks,_that.meta);case SearchPeopleSuccess() when peopleSuccess != null:
return peopleSuccess(_that.people,_that.meta);case SearchLoadingMore() when loadingMore != null:
return loadingMore(_that.currentItems,_that.meta);case SearchEmpty() when empty != null:
return empty();case SearchError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SearchInitial implements SearchState {
  const SearchInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class SearchLoading implements SearchState {
  const SearchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class SearchTasksSuccess implements SearchState {
  const SearchTasksSuccess({required final  List<TaskResponseData> tasks, required this.meta}): _tasks = tasks;
  

 final  List<TaskResponseData> _tasks;
 List<TaskResponseData> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  SearchMeta meta;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTasksSuccessCopyWith<SearchTasksSuccess> get copyWith => _$SearchTasksSuccessCopyWithImpl<SearchTasksSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTasksSuccess&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),meta);

@override
String toString() {
  return 'SearchState.tasksSuccess(tasks: $tasks, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchTasksSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchTasksSuccessCopyWith(SearchTasksSuccess value, $Res Function(SearchTasksSuccess) _then) = _$SearchTasksSuccessCopyWithImpl;
@useResult
$Res call({
 List<TaskResponseData> tasks, SearchMeta meta
});


$SearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchTasksSuccessCopyWithImpl<$Res>
    implements $SearchTasksSuccessCopyWith<$Res> {
  _$SearchTasksSuccessCopyWithImpl(this._self, this._then);

  final SearchTasksSuccess _self;
  final $Res Function(SearchTasksSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? meta = null,}) {
  return _then(SearchTasksSuccess(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskResponseData>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchMeta,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<$Res> get meta {
  
  return $SearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc


class SearchPeopleSuccess implements SearchState {
  const SearchPeopleSuccess({required final  List<SearchPersonData> people, required this.meta}): _people = people;
  

 final  List<SearchPersonData> _people;
 List<SearchPersonData> get people {
  if (_people is EqualUnmodifiableListView) return _people;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_people);
}

 final  SearchMeta meta;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPeopleSuccessCopyWith<SearchPeopleSuccess> get copyWith => _$SearchPeopleSuccessCopyWithImpl<SearchPeopleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPeopleSuccess&&const DeepCollectionEquality().equals(other._people, _people)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_people),meta);

@override
String toString() {
  return 'SearchState.peopleSuccess(people: $people, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchPeopleSuccessCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchPeopleSuccessCopyWith(SearchPeopleSuccess value, $Res Function(SearchPeopleSuccess) _then) = _$SearchPeopleSuccessCopyWithImpl;
@useResult
$Res call({
 List<SearchPersonData> people, SearchMeta meta
});


$SearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchPeopleSuccessCopyWithImpl<$Res>
    implements $SearchPeopleSuccessCopyWith<$Res> {
  _$SearchPeopleSuccessCopyWithImpl(this._self, this._then);

  final SearchPeopleSuccess _self;
  final $Res Function(SearchPeopleSuccess) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? people = null,Object? meta = null,}) {
  return _then(SearchPeopleSuccess(
people: null == people ? _self._people : people // ignore: cast_nullable_to_non_nullable
as List<SearchPersonData>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchMeta,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<$Res> get meta {
  
  return $SearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc


class SearchLoadingMore implements SearchState {
  const SearchLoadingMore({required final  List<dynamic> currentItems, required this.meta}): _currentItems = currentItems;
  

 final  List<dynamic> _currentItems;
 List<dynamic> get currentItems {
  if (_currentItems is EqualUnmodifiableListView) return _currentItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentItems);
}

 final  SearchMeta meta;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLoadingMoreCopyWith<SearchLoadingMore> get copyWith => _$SearchLoadingMoreCopyWithImpl<SearchLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadingMore&&const DeepCollectionEquality().equals(other._currentItems, _currentItems)&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_currentItems),meta);

@override
String toString() {
  return 'SearchState.loadingMore(currentItems: $currentItems, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchLoadingMoreCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchLoadingMoreCopyWith(SearchLoadingMore value, $Res Function(SearchLoadingMore) _then) = _$SearchLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<dynamic> currentItems, SearchMeta meta
});


$SearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchLoadingMoreCopyWithImpl<$Res>
    implements $SearchLoadingMoreCopyWith<$Res> {
  _$SearchLoadingMoreCopyWithImpl(this._self, this._then);

  final SearchLoadingMore _self;
  final $Res Function(SearchLoadingMore) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentItems = null,Object? meta = null,}) {
  return _then(SearchLoadingMore(
currentItems: null == currentItems ? _self._currentItems : currentItems // ignore: cast_nullable_to_non_nullable
as List<dynamic>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchMeta,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<$Res> get meta {
  
  return $SearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc


class SearchEmpty implements SearchState {
  const SearchEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.empty()';
}


}




/// @nodoc


class SearchError implements SearchState {
  const SearchError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchErrorCopyWith<SearchError> get copyWith => _$SearchErrorCopyWithImpl<SearchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SearchState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchErrorCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchErrorCopyWith(SearchError value, $Res Function(SearchError) _then) = _$SearchErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});


$ApiErrorModelCopyWith<$Res> get error;

}
/// @nodoc
class _$SearchErrorCopyWithImpl<$Res>
    implements $SearchErrorCopyWith<$Res> {
  _$SearchErrorCopyWithImpl(this._self, this._then);

  final SearchError _self;
  final $Res Function(SearchError) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SearchError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}

/// Create a copy of SearchState
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
