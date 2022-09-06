import 'package:data/service/service_payload.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/factorial_repository.dart';
import 'package:get_it/get_it.dart';

import '../interceptor/cookie_interceptor.dart';
import '../repository/factorial_repository.dart';
import '../service/api_base_service.dart';
import '../utils/const.dart';

void initDataInjector() {
  _initApiModule();
  _initRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerSingleton<Dio>(
    _buildFactorialDio(),
    instanceName: "factorialDio",
  );
  GetIt.I.registerSingleton<ApiBaseService<ServicePayload>>(
    ApiServiceImpl(GetIt.I.get(instanceName: "factorialDio")),
    instanceName: "factorialService",
  );

  GetIt.I.registerSingleton<Dio>(
    _buildCookieDio(),
    instanceName: "cookieDio",
  );
  GetIt.I.registerSingleton<ApiBaseService<ServicePayload>>(
    ApiServiceImpl(GetIt.I.get(instanceName: "cookieDio")),
    instanceName: "cookieService",
  );
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<NetworkRepository>(
    NetworkRepositoryImpl(
      GetIt.I.get<ApiBaseService>(instanceName: "factorialService"),
      GetIt.I.get<ApiBaseService>(instanceName: "cookieService"),
    ),
  );
}

Dio _buildFactorialDio() {
  final options = BaseOptions(
    sendTimeout: C.sendTimeout,
    receiveTimeout: C.receiveTimeout,
    connectTimeout: C.connectTimeout,
  );

  final dio = Dio(options);

  return dio;
}

Dio _buildCookieDio() {
  final options = BaseOptions(
    baseUrl: C.cookieBaseUrl,
    sendTimeout: C.sendTimeout,
    receiveTimeout: C.receiveTimeout,
    connectTimeout: C.connectTimeout,
  );

  final dio = Dio(options);
  dio.interceptors.addAll(
    [
      CookieInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ],
  );

  return dio;
}
