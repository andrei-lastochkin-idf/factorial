import 'package:domain/model/base_request.dart';

class FactorialRequest implements BaseRequest {
  final int value;

  FactorialRequest(this.value);

  @override
  Map<String, dynamic> toMap() => {'expr': 'factorial($value)'};
}
