import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const FORBID_URL = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class Webview extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForBid;

  Webview(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForBid = false})
      : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();
    // 监听url变化的回调
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {}
    });
    // 监听url错误的回调
    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError event) {
      print(event);
    });
    // 监听状态发生变化
    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print(state.url);
      switch (state.type) {
        case WebViewState.startLoad:
          // _isToMain：如果打开的页面在需要阻止的名单中需要阻拦
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForBid) {
              flutterWebViewPlugin.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
  }

  // 打开的是否首页
  _isToMain(String url) {
    bool contain = false;
    for (final value in FORBID_URL) {
      // 如果没有url的情况下返回false
      // 如果url.endsWith(value)不存在返回false
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// 状态栏颜色
    String statusBarColorStr = widget.statusBarColor ?? '#ffffff';
    Color backButtonColor;
    if (statusBarColorStr == '#ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
        body: Column(
      children: <Widget>[
        _appbar(Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
        Expanded(
            child: WebviewScaffold(
                url: widget.url,
                withZoom: true,
                withLocalStorage: true,
                hidden: true,
                initialChild: Container(
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text('Waiting.....'),
                  ),
                )))
      ],
    ));
  }

  // appbar的设置
  _appbar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      // 1. 不隐藏appbar
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    // 2. 隐藏appbar的状态下
    return Container(
      child: FractionallySizedBox(
          widthFactor: 1, // 盛满布局
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(Icons.close, color: backButtonColor, size: 26),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backgroundColor, fontSize: 26.0),
                )),
              )
            ],
          )),
    );
  }
}
