import 'package:dio/dio.dart';
import 'package:domain/repository/palindrome_repository.dart';
import 'package:get_it/get_it.dart';

import '../repository/factorial_repository.dart';
import '../service/api_base_service.dart';
import '../utils/const.dart';

void initDataInjector() {
  _initApiModule();
  _initRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerSingleton<Dio>(
    _dioBuilder(),
  );
  GetIt.I.registerSingleton<ApiBaseService>(
    ApiBaseService(
      GetIt.I.get(),
    ),
  );
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<FactorialRepository>(
    FactorialRepositoryImpl(
      GetIt.I.get<ApiBaseService>(),
    ),
  );
}

Dio _dioBuilder() {
  //provide base headers and interceptors here
  final options = BaseOptions(
    sendTimeout: C.sendTimeout,
    receiveTimeout: C.receiveTimeout,
    connectTimeout: C.connectTimeout,
  );

  final dio = Dio(options);

  return dio;
}
