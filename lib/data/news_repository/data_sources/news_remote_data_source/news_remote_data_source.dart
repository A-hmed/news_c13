import 'package:news_app_c13/data/api/api_manager.dart';
import 'package:news_app_c13/data/models/source_dm.dart';

// Firestore - sqflite - hive
class NewsRemoteDataSource {
  Future<List<SourceDM>> getSources(categoryId) async {
    return ApiManager.getSources(categoryId);
  }
}
