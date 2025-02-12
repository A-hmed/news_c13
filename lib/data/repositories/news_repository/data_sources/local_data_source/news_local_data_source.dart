import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:news_app_c13/data/models/source_dm.dart';

///Local data source for cache handling
class NewsLocalDataSource {
  Future<List<SourceDM>?> getSources(categoryId) async {
    try {
      Box hiveBox = await Hive.openBox("Sources");
      List<dynamic> sources = hiveBox.get(categoryId);
      print("sources in local: ${sources}");
      return sources.map((source) {
        return source as SourceDM;
      }).toList();
    } catch (e) {
      print("Exception: $e");
      throw "Please check your internet connection";
    }
  }

  Future<void> saveSources(categoryId, List<SourceDM> sources) async {
    Box hiveBox = await Hive.openBox("Sources");
    hiveBox.put(categoryId, sources);
  }
}

class SourceDMAdapter extends TypeAdapter<SourceDM> {
  @override
  final int typeId = 0; // Unique identifier for this adapter

  @override
  SourceDM read(BinaryReader reader) {
    return SourceDM.fromJson(jsonDecode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, SourceDM obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
