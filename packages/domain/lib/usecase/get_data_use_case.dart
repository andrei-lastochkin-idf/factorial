import 'package:domain/base/usecase.dart';
import 'package:domain/repository/factorial_repository.dart';

class GetDataUseCase implements UseCase {
  final NetworkRepository _repository;

  GetDataUseCase(this._repository);

  @override
  void call() {
    _repository.getData();
  }

  @override
  void dispose() {
  }

}