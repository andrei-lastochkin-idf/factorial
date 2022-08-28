import 'package:dio/dio.dart';

abstract class ApiBaseService {
  factory ApiBaseService(Dio dio) => ApiServiceImpl(dio);

  Future<Response<T>> get<T>(
    String path, {
    bool isResponseBytes,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  });

  Future<Response<T>> post<T>(
    String path, {
    bool isResponseBytes,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
}

class ApiServiceImpl implements ApiBaseService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Response<T>> get<T extends dynamic>(
    String path, {
    bool isResponseBytes = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    bool isResponseBytes = false,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response as Future<Response<T>>;
  }
}
