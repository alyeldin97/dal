// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewEntityAdapter extends TypeAdapter<ReviewEntity> {
  @override
  final int typeId = 2;

  @override
  ReviewEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewEntity(
      reviewerId: fields[0] as String,
      imageUrl: fields[1] as String,
      text: fields[2] as String,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.reviewerId)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
