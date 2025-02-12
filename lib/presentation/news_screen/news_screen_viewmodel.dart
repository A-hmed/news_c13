import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c13/core/api_state.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/data/repositories/news_repository/news_repository.dart';

/// Shared pref
/// Firebase firestore
/// Sqlflite
/// Hive
class NewsScreenViewModel extends Cubit<NewsViewModelState> {
  NewsRepository newsRepository = NewsRepository();

  NewsScreenViewModel() : super(NewsViewModelState.initial());

  Future<void> getSources(categoryId) async {
    try {
      // sourceApi = LoadingState();
      // notifyListeners();
      emit(NewsViewModelState(LoadingState()));
      List<SourceDM> sources = await newsRepository.getSources(categoryId);
      //   sourceApi = SuccessState(sources);
      //   notifyListeners();
      emit(NewsViewModelState(SuccessState(sources)));
    } catch (e) {
      // sourceApi = ErrorState(e.toString());
      //notifyListeners();
      emit(NewsViewModelState(ErrorState(e.toString())));
    }
  }
}

class NewsViewModelState {
  late ApiState sourceApi = LoadingState();

  ///Rest of cubit state

  NewsViewModelState(this.sourceApi);

  NewsViewModelState.initial() {
    sourceApi = LoadingState();
  }
}



// Providers -> InheritedWidgets
// Bloc-Cubit -> Streams of states
