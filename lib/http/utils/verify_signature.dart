import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_auction_module/utils/index.dart';
import 'package:flutter_auction_module/properties/index.dart';

// 操作系统
Map _osApi = {'android': '1', 'ios': '2'};

// 应用
Map _app = {'1': 'mall', '3': 'auction'};

// 验签方法
verifySignature(RequestOptions options) async {
  options.headers['wb-token'] = '14b74a5b-57b7-42b6-b0f7-7fa7491afa3a';
  options.headers['wb-appkey'] = config.appkey[_app['1']];

// 接口公共参数
  Map _commonQuery = {
    "app": '1', // 应用
    "os": _osApi[Platform.operatingSystem], // 操作系统
    "sysVersion": '10', // 系统版本
    "versionName": await Environment.getAppVersion(), // app版本号
    "deviceId": await Environment.getUUid(), // 设备id
  };

  // 验签的参数
  Map _signedQuery = {
    "time": new DateTime.now()
        .millisecondsSinceEpoch
        .toString()
        .substring(0, 10), // 时间戳
    "rcode": ToolUtils.generateRandomNum(4), // 随机数
  };

  // 验签 - GET请求
  if (options.method.toUpperCase() == 'GET') {
    options.queryParameters.remove('sign');
    Map _sortedObject = {
      ..._commonQuery,
      ..._signedQuery,
      ...options.queryParameters,
      'wb-token': options.headers['wb-token'],
    };
    // 对象升序
    Map _ascsortedObject = ToolUtils.ascSortObject(_sortedObject);

    /// 拼接参数
    ///app=3&deviceId=247afe50358da827&os=5&rcode=333&time=1594625671&wb-token=14b74a5b-57b7-42b6-b0f7-7fa7491afa3aA6AB94-4535CF-4755-8B19-461383C86E0D
    String _encodeStr =
        ToolUtils.jsonStringify(_ascsortedObject) + config.secretKey[_app['1']];

    // sign参数：Md5加密
    String signedStr = ToolUtils.generateMd5(_encodeStr);
    options.queryParameters = {
      ..._commonQuery,
      ..._signedQuery,
      ...options.queryParameters,
      'sign': signedStr
    };
  }

  // 验签 - POST请求
  if (options.method.toUpperCase() == 'POST') {
    options.data = {..._commonQuery, ...options.data ?? {}};
    Map _sortedObject = {
      ..._signedQuery,
      ..._commonQuery,
      'wb-token': options.headers['wb-token'],
      "body": jsonEncode(options.data ?? {})
    };
    // 对象升序
    Map _ascsortedObject = ToolUtils.ascSortObject(_sortedObject);

    /// 拼接参数
    /// app=1&body={"app":"1","os":"5","sysVersion":"10","versionName":"1.0.0","deviceId":"247afe50358da827"}
    /// &deviceId=247afe50358da827&os=5&rcode=333&sysVersion=10&time=1594624623&versionName=1.0.0&wb-token=14b74a5b-57b7-42b6-b0f7-7fa7491afa3aA6AB94-4535CF-4755-8B19-461383C86E0D
    String _encodeStr =
        ToolUtils.jsonStringify(_ascsortedObject, encode: false) +
            config.secretKey[_app['1']];

    // sign参数：Md5加密
    //
    String signedStr = ToolUtils.generateMd5(_encodeStr);
    options.queryParameters = {
      ..._commonQuery,
      ..._signedQuery,
      'sign': signedStr
    };
  }

  return options;
}
