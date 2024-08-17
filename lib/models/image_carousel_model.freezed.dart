// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_carousel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageCarouselModel {
  String get image => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageCarouselModelCopyWith<ImageCarouselModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCarouselModelCopyWith<$Res> {
  factory $ImageCarouselModelCopyWith(
          ImageCarouselModel value, $Res Function(ImageCarouselModel) then) =
      _$ImageCarouselModelCopyWithImpl<$Res, ImageCarouselModel>;
  @useResult
  $Res call({String image, String text});
}

/// @nodoc
class _$ImageCarouselModelCopyWithImpl<$Res, $Val extends ImageCarouselModel>
    implements $ImageCarouselModelCopyWith<$Res> {
  _$ImageCarouselModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageCarouselModelImplCopyWith<$Res>
    implements $ImageCarouselModelCopyWith<$Res> {
  factory _$$ImageCarouselModelImplCopyWith(_$ImageCarouselModelImpl value,
          $Res Function(_$ImageCarouselModelImpl) then) =
      __$$ImageCarouselModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, String text});
}

/// @nodoc
class __$$ImageCarouselModelImplCopyWithImpl<$Res>
    extends _$ImageCarouselModelCopyWithImpl<$Res, _$ImageCarouselModelImpl>
    implements _$$ImageCarouselModelImplCopyWith<$Res> {
  __$$ImageCarouselModelImplCopyWithImpl(_$ImageCarouselModelImpl _value,
      $Res Function(_$ImageCarouselModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? text = null,
  }) {
    return _then(_$ImageCarouselModelImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageCarouselModelImpl
    with DiagnosticableTreeMixin
    implements _ImageCarouselModel {
  _$ImageCarouselModelImpl({required this.image, required this.text});

  @override
  final String image;
  @override
  final String text;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageCarouselModel(image: $image, text: $text)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageCarouselModel'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('text', text));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageCarouselModelImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageCarouselModelImplCopyWith<_$ImageCarouselModelImpl> get copyWith =>
      __$$ImageCarouselModelImplCopyWithImpl<_$ImageCarouselModelImpl>(
          this, _$identity);
}

abstract class _ImageCarouselModel implements ImageCarouselModel {
  factory _ImageCarouselModel(
      {required final String image,
      required final String text}) = _$ImageCarouselModelImpl;

  @override
  String get image;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$ImageCarouselModelImplCopyWith<_$ImageCarouselModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
