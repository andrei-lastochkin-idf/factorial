import 'package:domain/usecase/factorial_usecase.dart';
import 'package:flutter/material.dart';
import 'package:presentation/screen/main/main_data.dart';
import 'package:presentation/screen/main/main_view_mapper.dart';
import 'package:presentation/screen/result/result_screen.dart';

import '../../base/bloc.dart';
import '../cookie/cookie_screen.dart';

abstract class MainBloc extends Bloc {
  factory MainBloc(
    FactorialUseCase useCase,
    MainViewMapper viewMapper,
  ) =>
      _MainBloc(
        useCase,
        viewMapper,
      );

  TextEditingController get editController;

  void getFactorial();

  void navigateToCookieTest();
}

class _MainBloc extends BlocImpl implements MainBloc {
  final FactorialUseCase _useCase;
  final MainViewMapper _viewMapper;

  final _screenData = MainData.init();
  final _editController = TextEditingController();

  _MainBloc(
    this._useCase,
    this._viewMapper,
  );

  @override
  TextEditingController get editController => _editController;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getFactorial() async {
    _updateData(isLoading: true);
    final currentValue = int.tryParse(_editController.text) ?? 0;
    final factorial = await _useCase(currentValue);
    final factorialValue = factorial.value;
    appNavigator.push(
      ResultScreen.page(ResultScreenArguments(factorial: factorialValue)),
    );
    _updateData(isLoading: false);
  }

  @override
  void navigateToCookieTest() {
    appNavigator.push(CookieScreen.page());
  }

  _updateData({bool? isLoading}) {
    handleData(
      data: _screenData,
      isLoading: isLoading,
    );
  }
}
