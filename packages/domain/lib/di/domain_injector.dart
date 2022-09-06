import 'package:domain/mapper/factorial_mapper.dart';
import 'package:domain/model/factorial_request.dart';
import 'package:domain/usecase/generate_cookie_usecase.dart';
import 'package:domain/usecase/get_data_use_case.dart';
import 'package:get_it/get_it.dart';

import '../mapper/mapper.dart';
import '../repository/factorial_repository.dart';
import '../usecase/factorial_usecase.dart';

void initDomainInjector() {
  _initUseCaseModule();
  _initMapperModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory<FactorialUseCase>(
    () => FactorialUseCase(
      GetIt.I.get<NetworkRepository>(),
      GetIt.I.get<Mapper<int, FactorialRequest>>(),
    ),
  );
  GetIt.I.registerFactory<GenerateCookieUseCase>(
    () => GenerateCookieUseCase(
      GetIt.I.get<NetworkRepository>(),
    ),
  );
  GetIt.I.registerFactory<GetDataUseCase>(
    () => GetDataUseCase(
      GetIt.I.get<NetworkRepository>(),
    ),
  );
}

void _initMapperModule() {
  GetIt.I.registerFactory<Mapper<int, FactorialRequest>>(
    () => FactorialMapper(),
  );
}
