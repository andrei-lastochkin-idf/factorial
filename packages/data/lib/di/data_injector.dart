import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../utils/const.dart';
import 'data_injector.config.dart';

@InjectableInit()
void configureDataDependencies(GetIt getIt) => $initGetIt(getIt);

@module
abstract class DataModule {
  //for third-party libraries

  @singleton
  Dio dio() => Dio(
        BaseOptions(
          sendTimeout: C.sendTimeout,
          receiveTimeout: C.receiveTimeout,
          connectTimeout: C.connectTimeout,
        ),
      );
}
