import 'package:data/service/service_payload.dart';
import 'package:domain/model/factorial_request.dart';
import 'package:domain/model/factorial_response.dart';
import 'package:domain/repository/factorial_repository.dart';

import '../service/api_base_service.dart';
import '../utils/const.dart';

class FactorialRepositoryImpl implements FactorialRepository {
  final ApiBaseService<ServicePayload> _apiService;

  FactorialRepositoryImpl(this._apiService);

  @override
  Future<FactorialResponse> getFactorial(FactorialRequest request) async {
    return _apiService
        .get(
          C.apiPath,
          queryParameters: request.toMap(),
        )
        .then(
          (response) => FactorialResponse(response.data),
        );
  }
}
