import 'package:domain/model/factorial_request.dart';
import 'package:domain/model/factorial_response.dart';

abstract class NetworkRepository {
  Future<FactorialResponse> getFactorial(FactorialRequest request);
  void generateCookie();
  void getData();
}
