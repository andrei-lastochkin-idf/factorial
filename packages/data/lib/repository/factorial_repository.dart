import 'package:data/service/service_payload.dart';
import 'package:domain/model/factorial_request.dart';
import 'package:domain/model/factorial_response.dart';
import 'package:domain/repository/factorial_repository.dart';

import '../service/api_base_service.dart';
import '../utils/const.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiBaseService<ServicePayload> _factorialApiService;
  final ApiBaseService<ServicePayload> _cookieApiService;

  NetworkRepositoryImpl(this._factorialApiService, this._cookieApiService);

  @override
  Future<FactorialResponse> getFactorial(FactorialRequest request) async {
    return _factorialApiService
        .get(
          C.apiPath,
          queryParameters: request.toMap(),
        )
        .then(
          (response) => FactorialResponse(response.data),
        );
  }

  @override
  void generateCookie() {
    _cookieApiService.get(C.cookieGeneratePath);
  }

  @override
  Future<void> getData() async {
    _cookieApiService.get(C.cookieGetDataPath);
  }
}
