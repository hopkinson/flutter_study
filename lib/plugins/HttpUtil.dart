import 'package:dio/dio.dart';
import 'package:flutter_study/config/index.dart';
import 'dart:math';

class HttpUtil {
  static Dio dio;

  static const String API_PREFIX = Config.api_baseUrl;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static const String GET = 'get';
  static const String POST = 'post';

  static Dio createInstance() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: API_PREFIX,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);
      dio = new Dio(options);
    }
    return dio;
  }
  
  static Future<Map> request(String url, {data, method, query}) async {
    var result;
    data = data ?? {};
    method = method ?? 'GET';
    Dio dio = createInstance();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.queryParameters['app'] = 1; // 应用  1.万表商城
      options.queryParameters['os'] = 4; // 系统平台 :m
      options.queryParameters['rcode'] = Random().nextInt(10); // 随机四位数
      options.queryParameters['time'] =
          DateTime.now().toUtc().millisecondsSinceEpoch; // unix时间戳
      return options;
    }
            // , onResponse: (Response response) async {
            //   return response; // continue
            // }, onError: (DioError e) async {
            //   // 当请求失败时做一些预处理
            //   return e; //continue
            // }

            ));

    try {
      Response response = await dio.request(url,
          queryParameters: query, data: data, options: Options(method: method));
      result = response.data;
    } on DioError catch (e) {
      print('请求 出错：' + e.toString());
    }
    return result;
  }
}
