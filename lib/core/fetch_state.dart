class FetchState {}

class NoInternetState extends FetchState {}

class LoadingState extends FetchState {}

class EmptyState extends FetchState {}

class SuccessState<T> extends FetchState {
  SuccessState(this.data);

  final T data;
}

class ErrorState<E extends Exception> extends FetchState {
  ErrorState(this.error);

  final E error;
}
