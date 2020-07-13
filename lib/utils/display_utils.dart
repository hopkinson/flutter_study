import 'package:flutter/material.dart';
import 'package:flutter_auction_module/http/utils/dio.dart';

///统一风格的常用UI展示
class DisplayUtil {
  ///通用tosat。context必须是Scaffold的子树
  static void showMsg(
    BuildContext context, {
    String text,
    Exception exception,
    bool isErrorMsg,
    Duration duration = const Duration(seconds: 2, milliseconds: 500),
  }) {
    isErrorMsg ??= (exception != null);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        elevation: 4,
        backgroundColor: isErrorMsg ? Color(0xFFFB5858) : null,
        content: Text(
          text ?? HttpUtils.parseError(exception),
          style: TextStyle(color: Colors.white),
        ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  //Dialog 封装
  static void showAlertDialog(BuildContext context, String contentText,
      {Function confirmCallback,
      Function dismissCallback,
      String confirmText = ""}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(contentText),
          actions: <Widget>[
            FlatButton(
              child: Text('我手滑了'),
              onPressed: () {
                if (dismissCallback != null) {
                  dismissCallback();
                }
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(confirmText == "" ? '取消' : confirmText),
              onPressed: () {
                if (confirmCallback != null) {
                  confirmCallback();
                }
                Navigator.of(context).pop();
              },
            )
          ],
          elevation: 20, //阴影
        );
      },
    );
  }
}
