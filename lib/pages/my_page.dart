import 'package:flutter/material.dart';
import 'package:flutter_study/components/common/image/image.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset('lib/assets/images/head-logo.png'),
        Text('万表logo'),
        ImageComponent(
            circle: true,
            src: 'mall/f5560dccc5bb45bc95567653691dc77d.jpg',
            onTap: () {
              print('nihao');
            }),
      ],
    );
  }
}
