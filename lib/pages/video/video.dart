// 视频页面

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auction_module/entity/base/list_entity.dart';
import 'package:flutter_auction_module/http/index.dart';
import 'package:flutter_auction_module/pages/video/provider/video_model.dart';
import 'package:flutter_auction_module/provider/provider_widget.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_auction_module/pages/video/provider/video_model.dart';
// import 'package:provider/provider.dart';
class VideoPage extends StatefulWidget {
  final String title;
  VideoPage({Key key, this.title = 'video-page'}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  BaseListEntity list;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('hi'),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Text(model.videoList[index].title),
                    Text(model.videoList[index].content),
                    Text(model.videoList[index].nickName),
                    Text(model.videoList[index].publishTime.toString()),
                  ],
                );
              },
              itemCount: model.videoList.length,
            )
            //  ListView(
            //   children: <Widget>[
            //     RaisedButton(
            //       child: Text('api请求'),
            //       onPressed: () {
            //         model.age = 124;
            //         model.getVideoList();
            //       },
            //     ),

            //   ],
            // ),
            );
      },
      model: VideoModel(),
      onModelReady: (model) {
        model.getVideoList();
      },
    );
  }
}
