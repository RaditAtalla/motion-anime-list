// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final int typeId = 1;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      title: fields[0] as String,
      image: fields[1] as String,
      type: fields[2] as String,
      episodes: fields[3] as int,
      rank: fields[4] as int,
      score: fields[5] as double,
      isFavorite: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.episodes)
      ..writeByte(4)
      ..write(obj.rank)
      ..writeByte(5)
      ..write(obj.score)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
