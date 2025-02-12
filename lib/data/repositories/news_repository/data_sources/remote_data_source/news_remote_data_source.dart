import 'package:news_app_c13/data/api/api_manager.dart';

import '../../../../models/source_dm.dart';

///Remote data source for apis handling
class NewsRemoteDataSource {
  Future<List<SourceDM>> getSources(categoryId) async {
    return ApiManager.getSources(categoryId);
  }
}
