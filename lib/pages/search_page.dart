import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_study/plugins/HttpUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study/model/home_model.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  fetchData() async {}

  // var result = fetchData();
  String resString = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        RaisedButton(
          child: Text('请求数据'),
          onPressed: () async {
            setState(() {
              resString = 'loading...';
            });
            var dio = Dio();
            Response response = await dio.get(
                'https://www.devio.org/io/flutter_app/json/home_page.json');

            setState(() {
              resString = response.toString();
            });
            // print(response.data);
            // final homeModel = homeModelFromJson(response.data);
            // print(homeModel);
          },
        ),
        Text(this.resString)
      ],
    ));
  }
}
