import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c13/core/api_state/api_state.dart';
import 'package:news_app_c13/data/news_repository/news_repository.dart';

import '../../data/models/source_dm.dart';

// InherItedWidget -> Provider
// Stream -> Bloc
class NewsScreenViewModel extends Cubit<NewsViewModelState> {
  NewsRepository newsRepository = NewsRepository();

  NewsScreenViewModel() : super(NewsViewModelState.initial());
  Future<void> getSources(categoryId) async {
    try {
      // sourceApi = LoadingState();
      // notifyListeners();
      // xController.add(event)
      emit(NewsViewModelState(LoadingState()));

      List<SourceDM> sources = await newsRepository.getSources(categoryId);
      // sourceApi = SuccessState(sources);
      // notifyListeners();
      emit(NewsViewModelState(SuccessState(sources)));
    } catch (e) {
      // sourceApi = ;
      // notifyListeners();
      emit(NewsViewModelState(ErrorState(e.toString())));
    }
  }
}

class NewsViewModelState {
  late ApiState sourceApi = LoadingState();

  NewsViewModelState(this.sourceApi);

  NewsViewModelState.initial() {
    sourceApi = LoadingState();
  }
}
