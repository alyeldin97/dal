import 'dart:convert';

import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/post/review.dart';
import 'package:projects_template/models/null_checkers.dart';

class ReviewModel {
  String reviewerId;
  String imageUrl;
  String text;
  String name;
  ReviewModel({
    required this.reviewerId,
    required this.imageUrl,
    required this.text,
    required this.name,
  });

  ReviewModel copyWith({
    String? reviewerId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return ReviewModel(
      reviewerId: reviewerId ?? this.reviewerId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.reviewerId: reviewerId,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.text: text,
      JsonKeys.name: name,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    String? reviewerId = map[JsonKeys.reviewerId] as String?;
    String? imageUrl = map[JsonKeys.imageUrl] as String?;
    String? text = map[JsonKeys.text] as String?;
    String? name = map[JsonKeys.name] as String?;

    return ReviewModel(
      reviewerId: reviewerId.ifNullOrEmptyReturn(''),
      imageUrl:
          imageUrl.ifNullOrEmptyReturn(AssetImagesPaths.categoryScreenBottom),
      text: text.ifNullOrEmptyReturn(''),
      name: name.ifNullOrEmptyReturn('لا يوجد اسم'),
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewerId: reviewerId,
      imageUrl: imageUrl,
      text: text,
      name: name,
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      imageUrl: reviewEntity.imageUrl,
      reviewerId: reviewEntity.reviewerId,
      text: reviewEntity.text,
      name: reviewEntity.name,
    );
  }
}
