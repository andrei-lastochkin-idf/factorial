import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/screen/cookie/data/cookie_data.dart';

import '../../base/bloc_data.dart';
import '../../navigation/base_page.dart';
import 'cookie_bloc.dart';

class CookieScreen extends StatefulWidget {
  const CookieScreen({Key? key}) : super(key: key);

  static const _routeName = '/CookieScreen';

  static BasePage page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const CookieScreen(),
        showSlideAnim: true,
      );

  @override
  State<StatefulWidget> createState() => _CookieState();
}

class _CookieState extends BlocScreenState<CookieScreen, CookieBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<CookieScreenData?>>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final screenData = snapshot.data?.data;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: bloc.getDashboard,
              child: const Text("Get info"),
            ),
            ElevatedButton(
              onPressed: bloc.generateCookie,
              child: const Text("Generate cookie"),
            ),
          ],
        );
      },
    );
  }
}
