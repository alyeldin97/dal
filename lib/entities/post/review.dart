import 'package:hive/hive.dart';
part 'review.g.dart';

@HiveType(typeId: 2)
class ReviewEntity {
  @HiveField(0)
  String reviewerId;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String text;
  @HiveField(3)
  String name;
  ReviewEntity({
    required this.reviewerId,
    required this.imageUrl,
    required this.text,
    required this.name,
  });

  ReviewEntity copyWith({
    String? reviewerId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return ReviewEntity(
      reviewerId: reviewerId ?? this.reviewerId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }
}
