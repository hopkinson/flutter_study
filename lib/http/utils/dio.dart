import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_auction_module/http/interceptors/log_interceptors.dart';
import 'package:flutter_auction_module/http/interceptors/signature_interceptors.dart';
import 'package:flutter_auction_module/utils/index.dart';
import 'package:flutter_auction_module/properties/index.dart';
import 'package:flutter_auction_module/utils/event_bus.dart';

import 'package:path_provider/path_provider.dart';

HttpUtils httpUtils = new HttpUtils();

class HttpUtils {
  //保存单例
  static HttpUtils _singleton = new HttpUtils._internal();

  //工厂构造函数
  factory HttpUtils() => _singleton;

  //单例模式

  Dio _dio;

  HttpUtils._internal() {
    if (null == _dio) {
      _dio = new Dio();
      _dio.options.baseUrl = config.rigBaseUrl;
      _dio.options.connectTimeout = 30 * 1000;
      _dio.options.sendTimeout = 30 * 1000;
      _dio.options.receiveTimeout = 30 * 1000;
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request(
      {Map<String, dynamic> queryParameters,
      String url,
      data,
      String method,
      bool isAddLoading = false,
      Map<String, dynamic> headers,
      BuildContext context,
      String loadingText}) async {
    Response response;

    headers = headers ?? {};
    queryParameters = queryParameters ?? {};
    data = data ?? {};
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();

    _dio.interceptors.add(SingatureInterceptors());
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));

    //显示 加载中的 loading
    if (isAddLoading) {
      eventBus.emit('showToast', loadingText);
    }

    try {
      response = await _dio.request(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: method));
      var responseData = response.data;
      if (responseData is String) {
        try {
          responseData = json.decode(responseData);
        } catch (e) {}
      }
      if (responseData is Map) {
        eventBus.emit('closeLoading');
        int errorCode = responseData['info']['error'] ?? 0;
        String errorMsg = responseData['info']['detailMessage'] ??
            responseData['info']['message'];
        // 1. 异常处理
        if (errorCode > 0) {
          List<num> loginCode = [403, 406];
          // 1.1 403，406 跳转登录页
          if (loginCode.contains(errorCode)) {
            _dio.clear();
            goLogin();
          }
          // 1.2 其他显示toast
          else {
            eventBus.emit('showToast', errorMsg);
          }
        } else {
          return responseData['data'];
        }
      }
    } on DioError catch (e) {
      print(e);
      eventBus.emit('showToast', parseError(e));
      eventBus.emit('closeLoading');
      return null;
    }
  }

  // http错误的提示
  static String parseError(error, {String defErrorString = '网络连接超时或者服务器未响应'}) {
    String errStr;
    if (error is DioError) {
      if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errStr = defErrorString;
      } else {
        errStr = error.message;
      }
    }
    return errStr ?? defErrorString;
  }

  // 跳转登录
  void goLogin() {}
}
