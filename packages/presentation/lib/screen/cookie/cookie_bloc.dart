import 'package:domain/usecase/generate_cookie_usecase.dart';
import 'package:domain/usecase/get_data_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/navigation/base_arguments.dart';

import 'data/cookie_data.dart';

abstract class CookieBloc extends Bloc<BaseArguments, CookieScreenData> {
  factory CookieBloc(
    GenerateCookieUseCase generateCookieUseCase,
    GetDataUseCase getDataUseCase,
  ) =>
      _CookieBloc(generateCookieUseCase, getDataUseCase);

  void getDashboard();

  void generateCookie();
}

class _CookieBloc extends BlocImpl<BaseArguments, CookieScreenData>
    implements CookieBloc {
  final GenerateCookieUseCase _generateCookieUseCase;
  final GetDataUseCase _getDataUseCase;

  _CookieBloc(this._generateCookieUseCase, this._getDataUseCase);

  @override
  void generateCookie() {
    _generateCookieUseCase();
  }

  @override
  void getDashboard() {
    _getDataUseCase();
  }
}
