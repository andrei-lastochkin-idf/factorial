import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';

import '../app/data/app_data.dart';

class FactorialApp extends StatefulWidget {
  const FactorialApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FactorialAppState();
}

class _FactorialAppState extends BlocScreenState<StatefulWidget, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<BlocData>(
        stream: bloc.dataStream,
        builder: (context, result) {
          final blocData = result.data;
          final appData = blocData?.data;
          if (appData is AppData) {
            return Scaffold(
              body: Navigator(
                onPopPage: (Route<dynamic> route, dynamic result) {
                  bloc.handleRemoveRouteSettings(route.settings);
                  return route.didPop(result);
                },
                pages: appData.pages.toList(),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
