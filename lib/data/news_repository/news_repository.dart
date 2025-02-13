import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/data/news_repository/data_sources/news_local_data_source/news_local_data_source.dart';
import 'package:news_app_c13/data/news_repository/data_sources/news_remote_data_source/news_remote_data_source.dart';

class NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSource();
  NewsLocalDataSource newsLocalDataSource = NewsLocalDataSource();
  Connectivity connectivity = Connectivity();

  Future<List<SourceDM>> getSources(categoryId) async {
    List<ConnectivityResult> connectivityOptions =
        await connectivity.checkConnectivity();
    bool isInternetConnected =
        connectivityOptions.contains(ConnectivityResult.wifi) ||
            connectivityOptions.contains(ConnectivityResult.mobile);

    if (isInternetConnected) {
      List<SourceDM> sources =
          await newsRemoteDataSource.getSources(categoryId);
      newsLocalDataSource.saveSources(categoryId, sources);
      return sources;
    } else {
      return newsLocalDataSource.getSources(categoryId);
    }
  }
}
