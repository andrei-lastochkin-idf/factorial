import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../navigation/app_navigator.dart';
import 'bloc_data.dart';

abstract class Bloc {
  Stream<BlocData> get dataStream;

  void initState();
}

abstract class BlocImpl implements Bloc {
  final _data = StreamController<BlocData>();
  final _blocData = BlocData.init();

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();

  @override
  Stream<BlocData> get dataStream => _data.stream;

  @protected
  void handleData({bool? isLoading, dynamic data}) {
    _blocData.updateParams(isLoading, data);
    _data.add(_blocData.copy());
  }

  @override
  void initState() {}
}
