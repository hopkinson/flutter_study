import 'dart:convert';
import 'dart:math';
import 'dart:core';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class ToolUtils {
  /// 对象按字母升序排序
  /// @param  {[object]} obj [需要升序的对象]
  /// @return {[object]}     [需要升序的对象]
  static Map ascSortObject(Map object) {
    Map result = {};
    List _arr = object.keys.toList();
    _arr.sort((a, b) => a.compareTo(b));
    for (num i = 0; i < _arr.length; i++) {
      result[_arr[i]] = object[_arr[i]];
    }
    return result;
  }

// 生成length位随机数
  static generateRandomNum(int length) {
    String result = '';
    for (var i = 0; i < length; i++) {
      result = result + Random().nextInt(10).toString();
    }
    return result;
  }

  // url参数序列化
  static String jsonStringify(Map obj, {bool encode = true}) {
    List str = [];
    for (var p in obj.keys.toList())
      if (obj.containsKey(p)) {
        str.add(Uri.encodeComponent(p) +
            "=" +
            (encode ? Uri.encodeComponent(obj[p]) : obj[p]));
      }
    return str.join("&");
  }

  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
