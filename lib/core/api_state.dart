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
