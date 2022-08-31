import 'package:presentation/screen/result/data/result_data.dart';
import 'package:presentation/screen/result/result_screen.dart';

import '../../base/bloc.dart';

abstract class ResultBloc
    extends Bloc<ResultScreenArguments, ResultScreenData> {
  factory ResultBloc() => _ResultBloc();
}

class _ResultBloc extends BlocImpl<ResultScreenArguments, ResultScreenData>
    implements ResultBloc {
  ResultScreenData _screenData = ResultScreenData();

  @override
  void initArgs(ResultScreenArguments arguments) {
    super.initArgs(arguments);
    _screenData = ResultScreenData(factorial: arguments.factorial);
    _updateData();
  }

  _updateData() {
    handleData(data: _screenData);
  }
}
