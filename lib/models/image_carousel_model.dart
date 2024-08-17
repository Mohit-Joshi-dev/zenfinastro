import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'image_carousel_model.freezed.dart';

@freezed
class ImageCarouselModel with _$ImageCarouselModel {
  factory ImageCarouselModel({
    required String image,
    required String text,
  }) = _ImageCarouselModel;
}
