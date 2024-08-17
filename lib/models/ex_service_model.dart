import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ex_service_model.freezed.dart';

@freezed
class ExServiceModel with _$ExServiceModel {
  factory ExServiceModel({
    required String image,
    required String title,
    required String subTitle,
    required bool isCyan,
  }) = _ExServiceModel;
}
