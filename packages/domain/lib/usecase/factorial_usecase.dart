import 'package:domain/base/usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/factorial.dart';
import '../repository/palindrome_repository.dart';

@injectable
class FactorialUseCase implements UseCaseParams<int, Future<Factorial>> {
  final FactorialRepository _repository;

  FactorialUseCase(this._repository);

  @override
  Future<Factorial> call(int n) async => await _repository.getFactorial(n);

  @override
  void dispose(){}
}
