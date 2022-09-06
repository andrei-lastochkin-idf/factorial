import 'package:domain/model/factorial_response.dart';
import 'package:presentation/screen/main/main_data.dart';

abstract class MainViewMapper{
  factory MainViewMapper() => _MainViewMapper();

  void mapFactorialResponseToScreenData(MainData dst, FactorialResponse src);
}

class _MainViewMapper implements MainViewMapper {
  @override
  void mapFactorialResponseToScreenData(MainData dst, FactorialResponse src) {
    dst.factorial = src.value;
  }
}