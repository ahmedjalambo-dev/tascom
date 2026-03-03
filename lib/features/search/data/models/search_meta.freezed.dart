// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchMeta {

 int get total; int get page; int get limit;
/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<SearchMeta> get copyWith => _$SearchMetaCopyWithImpl<SearchMeta>(this as SearchMeta, _$identity);

  /// Serializes this SearchMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit);

@override
String toString() {
  return 'SearchMeta(total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $SearchMetaCopyWith<$Res>  {
  factory $SearchMetaCopyWith(SearchMeta value, $Res Function(SearchMeta) _then) = _$SearchMetaCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit
});




}
/// @nodoc
class _$SearchMetaCopyWithImpl<$Res>
    implements $SearchMetaCopyWith<$Res> {
  _$SearchMetaCopyWithImpl(this._self, this._then);

  final SearchMeta _self;
  final $Res Function(SearchMeta) _then;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchMeta].
extension SearchMetaPatterns on SearchMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
return $default(_that.total,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit)  $default,) {final _that = this;
switch (_that) {
case _SearchMeta():
return $default(_that.total,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
return $default(_that.total,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMeta implements SearchMeta {
  const _SearchMeta({required this.total, required this.page, required this.limit});
  factory _SearchMeta.fromJson(Map<String, dynamic> json) => _$SearchMetaFromJson(json);

@override final  int total;
@override final  int page;
@override final  int limit;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMetaCopyWith<_SearchMeta> get copyWith => __$SearchMetaCopyWithImpl<_SearchMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit);

@override
String toString() {
  return 'SearchMeta(total: $total, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$SearchMetaCopyWith<$Res> implements $SearchMetaCopyWith<$Res> {
  factory _$SearchMetaCopyWith(_SearchMeta value, $Res Function(_SearchMeta) _then) = __$SearchMetaCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit
});




}
/// @nodoc
class __$SearchMetaCopyWithImpl<$Res>
    implements _$SearchMetaCopyWith<$Res> {
  __$SearchMetaCopyWithImpl(this._self, this._then);

  final _SearchMeta _self;
  final $Res Function(_SearchMeta) _then;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,}) {
  return _then(_SearchMeta(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
