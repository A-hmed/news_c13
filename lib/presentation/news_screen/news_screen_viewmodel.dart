import 'package:flutter/material.dart';
import 'package:news_app_c13/data/news_repository/news_repository.dart';

import '../../data/models/source_dm.dart';

class NewsScreenViewModel extends ChangeNotifier {
  // List<SourceDM> sources = [];
  // bool isLoading = false;
  // String errorMessage = "";
  ApiState sourceApi = LoadingState();
  NewsRepository newsRepository = NewsRepository();

  Future<void> getSources(categoryId) async {
    try {
      sourceApi = LoadingState();
      notifyListeners();
      List<SourceDM> sources = await newsRepository.getSources(categoryId);
      sourceApi = SuccessState(sources);
      notifyListeners();
    } catch (e) {
      sourceApi = ErrorState(e.toString());
      notifyListeners();
    }
  }
}

class ApiState {
  bool get hasError => this is ErrorState;

  bool get hasData => this is SuccessState;

  String get error => (this as ErrorState).errorMessage;

  T getData<T>() => (this as SuccessState<T>).data;
}

class SuccessState<T> extends ApiState {
  T data;

  SuccessState(this.data);
}

class ErrorState extends ApiState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadingState extends ApiState {}
