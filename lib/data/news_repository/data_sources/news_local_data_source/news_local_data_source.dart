import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_c13/data/models/source_dm.dart';

class NewsLocalDataSource {
  Future<List<SourceDM>> getSources(categoryId) async {
    Box sourcesBox = await Hive.openBox("sources_box");
    List<dynamic>? sources = sourcesBox.get(categoryId);
    if (sources == null) throw "Please check your internet connection";
    return sources.map((source) => source as SourceDM).toList();
  }

  Future<void> saveSources(categoryId, List<SourceDM> sources) async {
    Box sourcesBox = await Hive.openBox("sources_box");
    sourcesBox.put(categoryId, sources);
  }
}