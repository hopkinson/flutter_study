import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading {
  static OverlayEntry _overlayEntry; // 靠它加到屏幕上
  static String _msg;

  static void show(
    BuildContext context,
    String msg,
  ) async {
    _msg = msg;
    if (_msg == null || _msg.length < 1) {
      _msg = '处理中...';
    }

    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    if (_overlayEntry == null) {
      // 没有Overlay 那么造一个
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Material(
                color: Color(0xFFB8B8B8).withAlpha(23),
                child: Center(
                  child: Container(
                    width: ScreenUtil().setWidth(123),
                    height: ScreenUtil().setWidth(123),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                        color: Color(0xff565656),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xFFB8B8B8),
                              blurRadius: ScreenUtil().setWidth(2))
                        ],
                        borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setWidth(8)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
                          width: ScreenUtil().setWidth(66),
                          height: ScreenUtil().setWidth(66),
                          child: CircularProgressIndicator(strokeWidth: 3.0),
                        ),
                        Text(_msg,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(16))),
                      ],
                    ),
                  ),
                ),
              ));

      // 将Overlay塞到State中
      overlayState.insert(_overlayEntry);
    } else {
      // 重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
  }

  static void close() {
    try {
      // 移除Overlay
      _overlayEntry.remove();
      _overlayEntry = null;
    } catch (e) {}
  }
}
