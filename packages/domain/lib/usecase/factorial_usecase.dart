import 'package:domain/base/usecase.dart';
import 'package:domain/model/factorial_request.dart';

import '../mapper/mapper.dart';
import '../model/factorial_response.dart';
import '../repository/factorial_repository.dart';

class FactorialUseCase
    implements UseCaseInOut<int, Future<FactorialResponse>> {
  final NetworkRepository _repository;
  final Mapper<int, FactorialRequest> _mapper;

  FactorialUseCase(this._repository, this._mapper);

  @override
  Future<FactorialResponse> call(int n) async {
    final request = _mapper(n);
    return await _repository.getFactorial(request);
  }

  @override
  void dispose() {}
}
