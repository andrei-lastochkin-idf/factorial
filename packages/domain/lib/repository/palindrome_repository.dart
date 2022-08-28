import 'package:domain/model/factorial.dart';

abstract class FactorialRepository {
  Future<Factorial> getFactorial(int n);
}
