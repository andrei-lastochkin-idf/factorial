import 'package:flutter/material.dart';
import 'package:presentation/screen/factorial_app.dart';

import 'di/app_injector.dart';

void main() {
  configureDependencies();
  runApp(const FactorialApp());
}
