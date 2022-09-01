import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/screen/result/data/result_data.dart';
import 'package:presentation/screen/result/result_bloc.dart';

import '../../base/bloc_data.dart';
import '../../navigation/base_arguments.dart';
import '../../navigation/base_page.dart';

class ResultScreenArguments extends BaseArguments {
  String factorial;

  ResultScreenArguments({
    required this.factorial,
    Function(dynamic value)? result,
  }) : super(result: result);
}

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  static const _routeName = '/ResultScreen';

  static BasePage page(ResultScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const ResultScreen(),
        showSlideAnim: true,
        arguments: arguments,
      );

  @override
  State<StatefulWidget> createState() => _ResultState();
}

class _ResultState extends BlocScreenState<ResultScreen, ResultBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<ResultScreenData?>>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final screenData = snapshot.data?.data;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(screenData?.factorial ?? "nothing"),
              OutlinedButton(onPressed: bloc.goBack, child: const Text("Back")),
            ],
          ),
        );
      },
    );
  }
}
