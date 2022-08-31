import 'package:presentation/screen/main/main_screen.dart';

import '../../navigation/base_page.dart';

class AppData {
  final List<BasePage> pages;

  AppData(
    this.pages,
  );

  factory AppData.init() {
    final pages = List<BasePage>.from([MainScreen.page()]);
    return AppData(pages);
  }
}
