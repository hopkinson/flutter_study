import 'package:dio/dio.dart';
import 'package:flutter_auction_module/utils/index.dart';

// 延签
class SingatureInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    // 验签
    options = await verifySignature(options);
    return options;
  }
}
