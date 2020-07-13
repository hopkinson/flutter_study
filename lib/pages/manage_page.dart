import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_auction_module/widget/interaction/toast.dart';
import 'package:flutter_auction_module/widget/interaction/loading.dart';
import 'package:flutter_auction_module/utils/event_bus.dart';
import 'package:flutter_auction_module/routes/config/inner/router.dart';

class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(width: 750, height: 1334);

    // toast弹框
    eventBus.on('showToast', (message) {
      Future.microtask(() => Toast.show(context, message));
    });

    // loading - 显示
    eventBus.on('showLoading', (message) {
      Future.microtask(() => Loading.show(context, message));
    });

    // loading - 关闭
    eventBus.on('closeLoading', (message) {
      Future.microtask(() => Loading.close());
    });

    DateTime _lastPressedAt; //上次点击时间

    return WillPopScope(
        // 导航返回拦截
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(milliseconds: 500)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();

            // 点击手机的下发回退键盘，触发pop
            Navigator.maybePop(Router.context);
            return false;
          }
          return true;
        },
        child: Navigator(
            // 实现SPA
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) {
              // 路由表对应单页
              Widget _page = Router.routerStore[settings.name];

              // Cupertino路由动画
              return CupertinoPageRoute(
                  settings: settings, // 参数
                  builder: (context) {
                    // 每一个子页面的context
                    Router.setContext = context;
                    return _page;
                  });
            }));
  }
}
