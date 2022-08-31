import 'package:domain/usecase/factorial_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/main/main_view_mapper.dart';

import '../app/app_bloc.dart';
import '../navigation/app_navigator.dart';
import '../screen/main/main_bloc.dart';
import '../screen/result/result_bloc.dart';

void initPresentationInjector() {
  _initAppModule();
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
  GetIt.I.registerFactory<ResultBloc>(
    () => ResultBloc(),
  );
}

void _initAppModule() {
  GetIt.I.registerFactory<AppBloc>(
    () => AppBloc(),
  );
  GetIt.I.registerSingleton<AppNavigator>(
    AppNavigator(),
  );
}
