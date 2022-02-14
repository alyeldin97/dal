import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/post/like.dart';
import 'package:projects_template/models/null_checkers.dart';

class LikeModel {
  String likerId;
  String imageUrl;
  String text;
  String name;
  LikeModel({
    required this.likerId,
    required this.imageUrl,
    required this.text,
    required this.name,
  });

  LikeModel copyWith({
    String? likerId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return LikeModel(
      likerId: likerId ?? this.likerId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.likerId: likerId,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.text: text,
      JsonKeys.name: name,
    };
  }

  factory LikeModel.fromMap(Map<String, dynamic> map) {
    String? likerId = map[JsonKeys.likerId] as String?;
    String? imageUrl = map[JsonKeys.imageUrl] as String?;
    String? text = map[JsonKeys.text] as String?;
    String? name = map[JsonKeys.name] as String?;

    return LikeModel(
      likerId: likerId.ifNullOrEmptyReturn(''),
      imageUrl:
          imageUrl.ifNullOrEmptyReturn(AssetImagesPaths.categoryScreenBottom),
      text: text.ifNullOrEmptyReturn(''),
      name: name.ifNullOrEmptyReturn('لا يوجد اسم'),
    );
  }

  LikeEntity toEntity() {
    return LikeEntity(
        likerId: likerId, imageUrl: imageUrl, text: text, name: name);
  }
}
