import 'package:flutter/material.dart';
import 'package:flutter_auction_module/pages/debug/index.dart';

import 'package:flutter_auction_module/pages/home/index.dart';
import 'package:flutter_auction_module/domain/route_argument.dart';
import 'package:flutter_auction_module/routes/modules/index.dart';
import 'package:flutter_auction_module/routes/modules/video.dart';

class Router {
  static BuildContext _context;
  static BuildContext get context => _context;

  static set setContext(_c) => _context = _c;

  /*
    获取页面参数
    @context
    @defaultData
   */
  static T getPageArguments<T>(context, defaultData) {
    RouteArguments<T> _args = ModalRoute.of(context).settings.arguments ??
        RouteArguments<T>(defaultData);
    return _args.args;
  }

  // SPA 路由表配置
  static Map<String, Widget> get routerStore => {
        '/': HomePage(),
        // 调试页面
        '/debug': DebugPage(title: '调试页面'),
        // 回收
        ...Recycle.inner,
        ...Video.inner
      };
}
