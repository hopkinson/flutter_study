import 'package:flutter_auction_module/pages/video/video.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Video {
  // flutter内部的路由
  static Map inner = {'video': VideoPage()};

  // 与app交互的路由
  static Map<String, PageBuilder> boost = {};
}
