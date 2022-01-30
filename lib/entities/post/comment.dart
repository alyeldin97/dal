import 'package:projects_template/entities/post/reply.dart';

class CommentEntity {
  String id;
  String commenterId;
  String imageUrl;
  String text;
  String name;
  ReplyEntity reply;
  CommentEntity({
    required this.id,
    required this.commenterId,
    required this.imageUrl,
    required this.text,
    required this.name,
    required this.reply,
  });

  CommentEntity copyWith({
    String? commenterId,
    String? imageUrl,
    String? text,
    String? name,
    String? id,
    ReplyEntity? reply,
  }) {
    return CommentEntity(
      commenterId: commenterId ?? this.commenterId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
      id: id ?? this.id,
      reply: reply ?? this.reply,
    );
  }
}
