import 'package:flutter/material.dart';

// import 'package:flutter_boost/flutter_boost.dart';

import 'package:flutter_auction_module/pages/manage_page.dart';
import 'package:flutter_auction_module/properties/index.dart';
// import 'package:flutter_auction_module/pages/recycle/boost.dart';
// import 'package:flutter_auction_module/routes/config/boost/router.dart';
// import 'package:flutter_auction_module/routes/config/boost/observer.dart';

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    // flutter-boost引入
    // FlutterBoost.singleton.registerPageBuilders(<String, PageBuilder>{
    //   'firstFirst': (String pageName, Map<String, dynamic> params, String _) =>
    //       FirstFirstRouteWidget(),
    // });
    // FlutterBoost.singleton
    //     .addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: config.appName,
        // builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: ManagerPage());
  }

  // void _onRoutePushed(
  //   String pageName,
  //   String uniqueId,
  //   Map<String, dynamic> params,
  //   Route<dynamic> route,
  //   Future<dynamic> _,
  // ) {}
}
