abstract class DataState<T> {
  final T data;
  final int code;
  const DataState({required this.data, required this.code});
}

class Success extends DataState {
  Success({required super.data, required super.code});
}

class Failed extends DataState {
  Failed({required super.data, required super.code});
}
