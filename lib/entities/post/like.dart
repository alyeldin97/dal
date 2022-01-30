class LikeEntity {
  String likerId;
  String imageUrl;
  String text;
  String name;
  LikeEntity({
    required this.likerId,
    required this.imageUrl,
    required this.text,
    required this.name,
  });

  LikeEntity copyWith({
    String? likerId,
    String? imageUrl,
    String? text,
    String? name,
  }) {
    return LikeEntity(
      likerId: likerId ?? this.likerId,
      imageUrl: imageUrl ?? this.imageUrl,
      text: text ?? this.text,
      name: name ?? this.name,
    );
  }
}
