import '../model/factorial_request.dart';
import 'mapper.dart';

class FactorialMapper implements Mapper<int, FactorialRequest> {
  @override
  FactorialRequest call(int params) => FactorialRequest(params);
}
