import 'package:domain/model/factorial_request.dart';
import 'package:domain/model/factorial_response.dart';

abstract class FactorialRepository {
  Future<FactorialResponse> getFactorial(FactorialRequest request);
}
