import 'dart:convert';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/category.dart';
import 'package:projects_template/models/null_checkers.dart';

class CategoryModel {
  String name;
  String imageUrl;
  String id;
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.name: name,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.id: id,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    String name = map[JsonKeys.name];
    String imageUrl = map[JsonKeys.imageUrl];
    String id = map[JsonKeys.id];

    return CategoryModel(
      name: name.ifNullOrEmptyReturn(''),
      imageUrl: imageUrl.ifNullOrEmptyReturn(''),
      id: id.ifNullOrEmptyReturn(''),
    );
  }

  String toJson() => json.encode(toMap());

  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
      imageUrl: imageUrl,
      id: id,
    );
  }
}
