import 'package:flutter_auction_module/pages/recycle/boost.dart';
import 'package:flutter_auction_module/pages/recycle/index.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Recycle {
  // flutter内部的路由
  static Map inner = {'recycle-home': RecycleHome()};

  // 与app交互的路由
  static Map<String, PageBuilder> boost = {
    'recycle-boost': (String pageName, Map<String, dynamic> params, String _) =>
        FirstFirstRouteWidget(),
  };
}
