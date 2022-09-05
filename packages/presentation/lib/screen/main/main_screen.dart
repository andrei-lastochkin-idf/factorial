import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/main/main_data.dart';

import '../../base/bloc_screen.dart';
import 'main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const _routeName = '/MainScreen';

  static BasePage page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const MainScreen(),
      );

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends BlocScreenState<MainScreen, MainBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          final data = snapshot.data as BlocData;
          final blocData = data.data;
          if (blocData is MainData && !data.isLoading) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(blocData.factorial.toString()),
                    TextField(controller: bloc.editController),
                    ElevatedButton(
                      onPressed: bloc.getFactorial,
                      child: const Text('Get factorial'),
                    ),
                    ElevatedButton(
                      onPressed: bloc.navigateToCookieTest,
                      child: const Text('Cookie test'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        } else {
          return Scaffold(
            body: Container(),
          );
        }
      },
    );
  }
}
