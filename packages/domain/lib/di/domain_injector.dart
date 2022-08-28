import 'package:get_it/get_it.dart';

import '../repository/palindrome_repository.dart';
import '../usecase/factorial_usecase.dart';

void initDomainInjector() {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory<FactorialUseCase>(
    () => FactorialUseCase(
      GetIt.I.get<FactorialRepository>(),
    ),
  );
}
