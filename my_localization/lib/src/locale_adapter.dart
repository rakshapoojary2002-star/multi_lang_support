import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final int typeId = 1;

  @override
  Locale read(BinaryReader reader) {
    final languageCode = reader.readString();
    return Locale(languageCode);
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer.writeString(obj.languageCode);
  }
}
