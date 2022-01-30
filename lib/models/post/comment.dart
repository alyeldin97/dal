import 'dart:convert';

import 'package:projects_template/configs/constants/images.dart';
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/post/comment.dart';
import 'package:projects_template/models/null_checkers.dart';
import 'package:projects_template/models/post/reply.dart';

class CommentModel {
  String id;
  String commenterId;
  String imageUrl;
  String text;
  String name;
  ReplyModel reply;
  CommentModel({
    required this.id,
    required this.commenterId,
    required this.imageUrl,
    required this.text,
    required this.name,
    required this.reply,
  });

  CommentModel copyWith({
    String? commenterId,
    String? imageUrl,
    String? text,
    String? name,
    String? id,
    ReplyModel? reply,
  }) {
    return CommentModel(
      commenterId: commenterId ?? this.commenterId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
      id: id ?? this.id,
      reply: reply ?? this.reply,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.id: id,
      JsonKeys.commenterId: commenterId,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.text: text,
      JsonKeys.name: name,
      JsonKeys.reply: reply,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    String? id = map[JsonKeys.id] as String?;
    String? commenterId = map[JsonKeys.commenterId] as String?;
    String? imageUrl = map[JsonKeys.imageUrl] as String?;
    String? text = map[JsonKeys.text] as String?;
    String? name = map[JsonKeys.name] as String?;
    ReplyModel reply = ReplyModel.fromMap(map[JsonKeys.reply]);

    return CommentModel(
      id: id.ifNullOrEmptyReturn(''),
      commenterId: commenterId.ifNullOrEmptyReturn(''),
      imageUrl:
          imageUrl.ifNullOrEmptyReturn(AssetImagesPaths.categoryScreenBottom),
      text: text.ifNullOrEmptyReturn(''),
      name: name.ifNullOrEmptyReturn('لا يوجد اسم'),
      reply: reply,
    );
  }

  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      commenterId: commenterId,
      imageUrl: imageUrl,
      text: text,
      name: name,
      reply: reply.toEntity(),
    );
  }
}
