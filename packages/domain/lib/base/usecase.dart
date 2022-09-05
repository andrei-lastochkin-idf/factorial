abstract class UseCase<Output> {
  Output call();

  void dispose();
}

abstract class UseCaseInOut<Params, Output> {
  Output call(Params params);

  void dispose();
}

abstract class UseCaseIn<Params> {
  void call(Params params);

  void dispose();
}
