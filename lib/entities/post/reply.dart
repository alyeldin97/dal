
class ReplyEntity {
  String replierId;
  String imageUrl;
  String text;
  String name;
  ReplyEntity({
    required this.replierId,
    required this.imageUrl,
    required this.text,
    required this.name,

  });



  ReplyEntity copyWith({
    String? replierId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return ReplyEntity(
      replierId: replierId ?? this.replierId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name??this.name,
    );
  }
}