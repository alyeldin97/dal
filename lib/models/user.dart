import 'package:projects_template/configs/constants/json_keys.dart';
import 'package:projects_template/entities/user.dart';
import 'package:projects_template/models/null_checkers.dart';
import 'package:projects_template/models/post/review.dart';

class UserModel {
  String id;
  String email;
  String name;
  String imageUrl;
  String phoneNumber;
  List<ReviewModel> reviews;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.imageUrl,
    required this.reviews,
    required this.phoneNumber,
  });

  UserEntity toEntity() {
    return UserEntity(
        email: email,
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        reviews: reviews.map((review) => review.toEntity()).toList());
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
        email: userEntity.email,
        id: userEntity.id,
        name: userEntity.name,
        phoneNumber: userEntity.phoneNumber,
        reviews: userEntity.reviews
            .map((review) => ReviewModel.fromEntity(review))
            .toList(),
        imageUrl: '');
  }

  Map<String, dynamic> toMap() {
    return {
      JsonKeys.id: id,
      JsonKeys.email: email,
      JsonKeys.name: name,
      JsonKeys.phoneNumber: phoneNumber,
      JsonKeys.reviews: reviews.map((review) => review.toMap()).toList(),
      JsonKeys.imageUrl: imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    String? id = map[JsonKeys.id] as String?;
    String? email = map[JsonKeys.email] as String?;
    String? name = map[JsonKeys.name] as String?;
    String? imageUrl = map[JsonKeys.imageUrl] as String?;
    String? phoneNumber = map[JsonKeys.phoneNumber] as String?;

    List<dynamic>? reviews = map[JsonKeys.reviews];

    return UserModel(
      id: id.ifNullOrEmptyReturn(''),
      email: email.ifNullOrEmptyReturn(''),
      name: name.ifNullOrEmptyReturn(''),
      imageUrl: imageUrl.ifNullOrEmptyReturn(''),
      phoneNumber: phoneNumber.ifNullOrEmptyReturn(''),
      reviews: reviews != null
          ? reviews.map((reviewMap) => ReviewModel.fromMap(reviewMap)).toList()
          : [],
    );
  }
}
