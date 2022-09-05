import 'package:domain/base/usecase.dart';
import 'package:domain/repository/factorial_repository.dart';

class GenerateCookieUseCase implements UseCase {
  final NetworkRepository _repository;

  GenerateCookieUseCase(this._repository);

  @override
  void call() {
    _repository.generateCookie();
  }

  @override
  void dispose() {}
}
