import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/source_dm.dart';
import 'package:news_app_c13/data/repositories/news_repository/news_repository.dart';

/// Shared pref
/// Firebase firestore
/// Sqlflite
/// Hive
class NewsScreenViewModel extends ChangeNotifier {
  NewsRepository newsRepository = NewsRepository();
  ApiState sourceApi = LoadingState();

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

// Providers -> InheritedWidgets
// Bloc-Cubit -> Streams of states
