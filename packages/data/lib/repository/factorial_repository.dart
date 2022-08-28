import 'package:domain/repository/palindrome_repository.dart';

import '../service/api_base_service.dart';
import '../utils/const.dart';
import 'package:domain/model/factorial.dart';

class FactorialRepositoryImpl implements FactorialRepository {
  final ApiBaseService _apiService;

  FactorialRepositoryImpl(this._apiService);

  @override
  Future<Factorial> getFactorial(int n) async {
    final params = {'expr': 'factorial($n)'};
    return _apiService
        .get(
          C.apiPath,
          queryParameters: params,
        )
        .then(
          (response) => Factorial(response.data),
        );
  }
}
