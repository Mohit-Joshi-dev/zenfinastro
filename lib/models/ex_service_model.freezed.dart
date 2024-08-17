// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ex_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExServiceModel {
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  bool get isCyan => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExServiceModelCopyWith<ExServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExServiceModelCopyWith<$Res> {
  factory $ExServiceModelCopyWith(
          ExServiceModel value, $Res Function(ExServiceModel) then) =
      _$ExServiceModelCopyWithImpl<$Res, ExServiceModel>;
  @useResult
  $Res call({String image, String title, String subTitle, bool isCyan});
}

/// @nodoc
class _$ExServiceModelCopyWithImpl<$Res, $Val extends ExServiceModel>
    implements $ExServiceModelCopyWith<$Res> {
  _$ExServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = null,
    Object? subTitle = null,
    Object? isCyan = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isCyan: null == isCyan
          ? _value.isCyan
          : isCyan // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExServiceModelImplCopyWith<$Res>
    implements $ExServiceModelCopyWith<$Res> {
  factory _$$ExServiceModelImplCopyWith(_$ExServiceModelImpl value,
          $Res Function(_$ExServiceModelImpl) then) =
      __$$ExServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, String title, String subTitle, bool isCyan});
}

/// @nodoc
class __$$ExServiceModelImplCopyWithImpl<$Res>
    extends _$ExServiceModelCopyWithImpl<$Res, _$ExServiceModelImpl>
    implements _$$ExServiceModelImplCopyWith<$Res> {
  __$$ExServiceModelImplCopyWithImpl(
      _$ExServiceModelImpl _value, $Res Function(_$ExServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = null,
    Object? subTitle = null,
    Object? isCyan = null,
  }) {
    return _then(_$ExServiceModelImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isCyan: null == isCyan
          ? _value.isCyan
          : isCyan // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExServiceModelImpl
    with DiagnosticableTreeMixin
    implements _ExServiceModel {
  _$ExServiceModelImpl(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.isCyan});

  @override
  final String image;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final bool isCyan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExServiceModel(image: $image, title: $title, subTitle: $subTitle, isCyan: $isCyan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExServiceModel'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subTitle', subTitle))
      ..add(DiagnosticsProperty('isCyan', isCyan));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExServiceModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.isCyan, isCyan) || other.isCyan == isCyan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, title, subTitle, isCyan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExServiceModelImplCopyWith<_$ExServiceModelImpl> get copyWith =>
      __$$ExServiceModelImplCopyWithImpl<_$ExServiceModelImpl>(
          this, _$identity);
}

abstract class _ExServiceModel implements ExServiceModel {
  factory _ExServiceModel(
      {required final String image,
      required final String title,
      required final String subTitle,
      required final bool isCyan}) = _$ExServiceModelImpl;

  @override
  String get image;
  @override
  String get title;
  @override
  String get subTitle;
  @override
  bool get isCyan;
  @override
  @JsonKey(ignore: true)
  _$$ExServiceModelImplCopyWith<_$ExServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
