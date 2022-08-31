import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bloc.dart';

abstract class BlocScreenState<SW extends StatefulWidget, B extends Bloc> extends State<SW> {
  @protected
  final bloc = GetIt.I.get<B>();

  @override
  void initState() {
    super.initState();
    bloc.initState();
  }
}
