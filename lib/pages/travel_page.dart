import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

const CITY_NAME = {
  '北京': ['东城区', '朝阳区', '西城区'],
  '广州': ['越秀区', '海珠区', '荔湾区'],
  '北京2': ['东城区', '朝阳区', '西城区'],
  '广州2': ['越秀区', '海珠区', '荔湾区'],
  '北京3': ['东城区', '朝阳区', '西城区'],
  '广州4': ['越秀区', '海珠区', '荔湾区'],
  '北京5': ['东城区', '朝阳区', '西城区'],
  '广州7': ['越秀区', '海珠区', '荔湾区'],
  '北京8': ['东城区', '朝阳区', '西城区'],
  '广州3': ['越秀区', '海珠区', '荔湾区'],
  '北京1': ['东城区', '朝阳区', '西城区'],
  '广州22': ['越秀区', '海珠区', '荔湾区'],
  '北京33': ['东城区', '朝阳区', '西城区'],
  '广州223': ['越秀区', '海珠区', '荔湾区']
};

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView(children: _buildList()),
    ));
  }

  // 处理下拉刷新
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    print('refresh-end');
    return null;
  }

  
  List<Widget> _buildList() {
    List<Widget> widgets = [];
    CITY_NAME.forEach((key, value) {
      widgets.add(_item(key, CITY_NAME[key]));
    });
    return widgets;
  }

  Widget _item(String city, List<String> subCities) {
    return ExpansionTile(
      title: Text(city, style: TextStyle(color: Colors.blue, fontSize: 20.0)),
      children: subCities.map((item) => _buildSubcity(item)).toList(),
    );
  }

  Widget _buildSubcity(String subcity) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 50,
          color: Colors.red,
          margin: EdgeInsets.only(bottom: 5),
          child: Text(subcity),
        ));
  }
}
