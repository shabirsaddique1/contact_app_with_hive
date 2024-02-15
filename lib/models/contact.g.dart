// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      phoneNumber: fields[2] as String,
      nickname: fields[3] as String,
      email: fields[4] as String,
      groups: (fields[5] as List).cast<String>(),
      notes: fields[6] as String,
      relationship: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.nickname)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.groups)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.relationship);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
