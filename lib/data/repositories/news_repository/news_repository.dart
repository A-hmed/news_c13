import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/data/repositories/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_app_c13/data/repositories/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';

class NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSource();
  NewsLocalDataSource newsLocalDataSource = NewsLocalDataSource();
  Connectivity connectivity = Connectivity();

  Future<List<SourceDM>> getSources(categoryId) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity.checkConnectivity());
    bool isInternetConnected =
        connectivityResult.contains(ConnectivityResult.wifi) ||
            connectivityResult.contains(ConnectivityResult.mobile);
    if (isInternetConnected) {
      List<SourceDM> sources =
          await newsRemoteDataSource.getSources(categoryId);
      await newsLocalDataSource.saveSources(categoryId, sources);
      return sources;
    } else {
      List<SourceDM>? sources =
          await newsLocalDataSource.getSources(categoryId);
      if (sources == null)
        throw "Please check your internet connection and try again later";
      return sources;
    }
  }
}
