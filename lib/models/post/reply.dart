import 'dart:convert';

import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/post/reply.dart';
import 'package:projects_template/models/null_checkers.dart';

class ReplyModel {
  String replierId;
  String imageUrl;
  String text;
  String name;
  ReplyModel({
    required this.replierId,
    required this.imageUrl,
    required this.text,
    required this.name,
  });

  ReplyModel copyWith({
    String? replierId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return ReplyModel(
      replierId: replierId ?? this.replierId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.replierId: replierId,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.text: text,
      JsonKeys.name: name,
    };
  }

  factory ReplyModel.fromMap(Map<String, dynamic> map) {
    String replierId = map[JsonKeys.replierId] as String;
    String imageUrl = map[JsonKeys.imageUrl] as String;
    String text = map[JsonKeys.text] as String;
    String name = map[JsonKeys.name] as String;

    return ReplyModel(
      replierId: replierId.ifNullOrEmptyReturn(''),
      imageUrl:
          imageUrl.ifNullOrEmptyReturn(AssetImagesPaths.categoryScreenBottom),
      text: text.ifNullOrEmptyReturn(''),
      name: name.ifNullOrEmptyReturn('لا يوجد اسم'),
    );
  }

  ReplyEntity toEntity() {
    return ReplyEntity(
        replierId: replierId, imageUrl: imageUrl, text: text, name: name);
  }
}
