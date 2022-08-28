class BlocData {
  bool isLoading;
  dynamic data;
  BlocData(
    this.isLoading,
    this.data,
  );

  factory BlocData.init() => BlocData(
        false,
        null,
      );

  BlocData copy() => BlocData(
        isLoading,
        data,
      );

  void updateParams(
    bool? isLoading,
    dynamic data,
  ) {
    if (isLoading != null) this.isLoading = isLoading;
    if (data != null) this.data = data;
  }
}
