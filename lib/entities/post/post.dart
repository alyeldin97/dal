import 'package:projects_template/entities/post/comment.dart';
import 'package:projects_template/entities/post/like.dart';
import 'package:projects_template/entities/post/review.dart';

class PostEntity {
  String id;
  String address;
  String posterName;
  String posterImageUrl;
  DateTime date;
  String posterId;
  String imageUrl;
  String categoryId;
  String description;
  List<LikeEntity> likes;
  List<CommentEntity> comments;
  List<ReviewEntity> reviews;
  PostEntity({
    required this.id,
    required this.address,
    required this.posterName,
    required this.posterId,
    required this.imageUrl,
    required this.categoryId,
    required this.description,
    required this.likes,
    required this.comments,
    required this.reviews,
    required this.posterImageUrl,
    required this.date,

  });

  PostEntity copyWith({
    String? id,
    String? address,
    String? posterName,
    String? posterId,
    String? imageUrl,
    String? categoryId,
    String? description,
    String? posterImageUrl,
    DateTime? date,
    List<LikeEntity>? likes,
    List<CommentEntity>? comments,
    List<ReviewEntity>? reviews,
  }) {
    return PostEntity(
      id: id ?? this.id,
      address: address ?? this.address,
      posterName: posterName ?? this.posterName,
      posterId: posterId ?? this.posterId,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      reviews: reviews ?? this.reviews,
      posterImageUrl: posterImageUrl ?? this.posterImageUrl,
      date: date ?? this.date,


    );
  }

  @override
  String toString() {
    return 'PostEntity(id: $id, address: $address, posterName: $posterName, posterImageUrl: $posterImageUrl, posterId: $posterId, imageUrl: $imageUrl, categoryId: $categoryId, description: $description, likes: $likes, comments: $comments, reviews: $reviews), date: $date)';
  }
}
