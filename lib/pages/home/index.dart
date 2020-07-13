import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auction_module/properties/index.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(config.appName),
      ),
      child: Center(
        child: FlatButton(
          child: Text('进入debug页面'),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'video');
          },
        ),
      ),
    );
  }
}
