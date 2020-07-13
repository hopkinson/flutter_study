// 阿里云埋点
import 'package:dio/dio.dart';

class AliTrack {
  static action(
      {logstores = 'probe_log1',
      eventProps,
      event,
      eventPage,
      station = 'wbshare'}) async {
    try {
      String project = 'wbiao-probe';
      String host = 'cn-hangzhou.log.aliyuncs.com';
      // ignore: todo
      // TODO: 没加上生产环境
      // const logstore = isProduction ? logstores :
      String logstore = logstores + '-test';

      String url = 'https://$project.$host/logstores/$logstore/track';

      Response response = await Dio().get(url, queryParameters: {
        "APIVersion": '0.6.0',
        "eventTime": new DateTime.now().millisecondsSinceEpoch.toString(),
        "eventPageType": "app",
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
