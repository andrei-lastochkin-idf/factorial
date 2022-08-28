import 'package:data/di/data_injector.dart';
import 'package:domain/di/domain_injector.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/di/presentation_injector.dart';

final getIt = GetIt.I;

@InjectableInit()
void configureDependencies() {
  configureDataDependencies(getIt);
  configureDomainDependencies(getIt);
  configurePresentationDependencies(getIt);
}
