import 'package:flutter/material.dart';
import 'package:news_app_c13/data/api/api_manager.dart';

class NewsScreenViewModel extends ChangeNotifier {
  // List<SourceDM> sources = [];
  // bool isLoading = false;
  // String errorMessage = "";
  ApiState sourceApi = LoadingState();

  Future<void> getSources(categoryId) async {
    try {
      sourceApi = LoadingState();
      notifyListeners();
      ;
      sourceApi = SuccessState(await ApiManager.getSources(categoryId));
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
