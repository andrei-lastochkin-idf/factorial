import 'package:domain/model/factorial.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/screen/main/main_data.dart';

@injectable
abstract class MainViewMapper{
  @factoryMethod
  factory MainViewMapper() => _MainViewMapper();

  void mapFactorialResponseToScreenData(MainData dst, Factorial src);
}

class _MainViewMapper implements MainViewMapper {
  @override
  void mapFactorialResponseToScreenData(MainData dst, Factorial src) {
    dst.factorial = src.value;
  }
}