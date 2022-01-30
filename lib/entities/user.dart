import 'package:hive/hive.dart';

import 'package:projects_template/entities/post/review.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  @HiveField(0)
  String id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String name;
  @HiveField(3)
  String phoneNumber;
  @HiveField(4)
  List<ReviewEntity> reviews;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.reviews,
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, reviews: $reviews)';
  }
}
