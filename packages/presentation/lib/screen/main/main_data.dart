class MainData {
  String factorial;

  MainData(this.factorial);

  factory MainData.init() => MainData('0');

  MainData copy() => MainData(factorial);
}
