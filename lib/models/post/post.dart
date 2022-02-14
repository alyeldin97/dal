
import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/post/post.dart';
import 'package:projects_template/models/null_checkers.dart';

import 'package:projects_template/models/post/comment.dart';
import 'package:projects_template/models/post/like.dart';
import 'package:projects_template/models/post/review.dart';

class PostModel  {
  String id;
  String address;
  String posterName;
  String posterImageUrl;
  String posterId;
  String imageUrl;
  String categoryId;
  DateTime date;
  String description;
  List<LikeModel> likes;
  List<CommentModel> comments;
  List<ReviewModel> reviews;
  PostModel({
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

  PostModel copyWith({
    String? id,
    String? address,
    String? posterName,
    String? posterId,
    String? imageUrl,
    String? categoryId,
    String? description,
    String? posterImageUrl,
    List<LikeModel>? likes,
    List<CommentModel>? comments,
    List<ReviewModel>? reviews,
    DateTime? date,
  }) {
    return PostModel(
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

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.id: id,
      JsonKeys.address: address,
      JsonKeys.posterName: posterName,
      JsonKeys.posterId: posterId,
      JsonKeys.posterImageUrl: posterImageUrl,
      JsonKeys.imageUrl: imageUrl,
      JsonKeys.date: date,
      JsonKeys.categoryId: categoryId,
      JsonKeys.description: description,
      JsonKeys.likes: likes.map((x) => x.toMap()).toList(),
      JsonKeys.comments: comments.map((x) => x.toMap()).toList(),
      JsonKeys.reviews: reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    String? id = map[JsonKeys.id] as String?;
    String? address = map[JsonKeys.address] as String?;
    String? posterName = map[JsonKeys.name] as String?;
    String? posterId = map[JsonKeys.posterId] as String?;
    String? imageUrl = map[JsonKeys.imageUrl] as String?;
    String? categoryId = map[JsonKeys.categoryId] as String?;
    String? description = map[JsonKeys.description] as String?;
    String? posterImageUrl = map[JsonKeys.posterImageUrl] as String?;
    DateTime? date = map[JsonKeys.date].toDate();
    date = date ?? DateTime.now().subtract(const Duration(days: 90));

    return PostModel(
      id: id.ifNullOrEmptyReturn(''),
      address: address.ifNullOrEmptyReturn(''),
      posterName: posterName.ifNullOrEmptyReturn(''),
      posterId: posterId.ifNullOrEmptyReturn(''),
      posterImageUrl: posterImageUrl.ifNullOrEmptyReturn(''),
      imageUrl: imageUrl.ifNullOrEmptyReturn(''),
      categoryId: categoryId.ifNullOrEmptyReturn(''),
      description: description.ifNullOrEmptyReturn(''),
      date: date,
      likes:
          List<LikeModel>.from(map[JsonKeys.likes]?.map((x) => LikeModel.fromMap(x))),
      comments: List<CommentModel>.from(
          map[JsonKeys.comments]?.map((x) => CommentModel.fromMap(x))),
      reviews: List<ReviewModel>.from(
          map[JsonKeys.reviews]?.map((x) => ReviewModel.fromMap(x))),
    );
  }

  PostEntity toEntity() {
    return PostEntity(
      id: id,
      date: date,
      address: address,
      posterName: posterName,
      posterId: posterId,
      posterImageUrl: posterImageUrl,
      imageUrl: imageUrl,
      categoryId: categoryId,
      description: description,
      likes: likes.map((like) => like.toEntity()).toList(),
      comments: comments.map((comment) => comment.toEntity()).toList(),
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }
}
