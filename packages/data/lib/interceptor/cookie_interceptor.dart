import 'dart:io';

import 'package:dio/dio.dart';

class CookieInterceptor extends Interceptor {
  final List<Cookie> cookies = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.cookieHeader] =
        cookies.map((e) => '${e.name}=${e.value}').join(';');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.headers[HttpHeaders.setCookieHeader]?.forEach(
      (e) {
        cookies.add(Cookie.fromSetCookieValue(e));
      },
    );
    super.onResponse(response, handler);
  }
}
