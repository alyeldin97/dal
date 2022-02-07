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
  @HiveField(5)
  String address;
  @HiveField(6)
  String imageUrl;
  @HiveField(7)
  bool isMale;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.reviews,
    required this.address,
    required this.imageUrl,
    required this.isMale,

  });

 

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    List<ReviewEntity>? reviews,
    String? address,
    String? imageUrl,
    bool? isMale,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reviews: reviews ?? this.reviews,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      isMale: isMale ?? this.isMale,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, reviews: $reviews, address: $address, imageUrl: $imageUrl, isMale: $isMale)';
  }
}
