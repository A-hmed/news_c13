import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:news_app_c13/data/models/source_dm.dart';

class SourceDMAdapter extends TypeAdapter<SourceDM> {
  @override
  final int typeId = 0; // Unique ID for this adapter

  @override
  SourceDM read(BinaryReader reader) {
    var string = reader.readString();
    var json = jsonDecode(string);
    return SourceDM.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, SourceDM obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
