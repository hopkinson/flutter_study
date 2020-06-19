import 'package:flutter/material.dart';
import 'package:flutter_study/plugins/HttpUtil.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  fetchData() async {
    var result = await HttpUtil.request('/api/shop/base',
        method: HttpUtil.GET, query: {"shopCode": 59});
    // print(result);
  }

  // var result = fetchData();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Center(
        child: RaisedButton(
          child: Text('请求数据'),
          onPressed: () {
            fetchData();
          },
        ),
      ),
    ));
  }
}
