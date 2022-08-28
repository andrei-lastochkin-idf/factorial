import 'package:domain/usecase/factorial_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/main/main_view_mapper.dart';

import '../screen/main/main_bloc.dart';

void initPresentationInjector() {
  _initViewMapperModule();
  _initBlocModule();
}

void _initViewMapperModule() {
  GetIt.I.registerFactory<MainViewMapper>(
    () => MainViewMapper(),
  );
}

void _initBlocModule() {
  GetIt.I.registerFactory<MainBloc>(
    () => MainBloc(
      GetIt.I.get<FactorialUseCase>(),
      GetIt.I.get<MainViewMapper>(),
    ),
  );
}
