// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentCacheModelAdapter extends TypeAdapter<ContentCacheModel> {
  @override
  final int typeId = 0;

  @override
  ContentCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContentCacheModel(
      moduleList: (fields[0] as List).cast<String>(),
      name: fields[1] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContentCacheModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.moduleList)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
