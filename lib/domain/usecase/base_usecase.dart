abstract class BaseUseCase<T, P> {
  Future<T> execute(P params);
}
