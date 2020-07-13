import 'package:flutter/material.dart';
import 'package:flutter_auction_module/entity/base/list_entity.dart';
import 'package:flutter_auction_module/entity/video/video_list.dart';
import 'package:flutter_auction_module/http/index.dart';

class VideoModel with ChangeNotifier {
  List<VideoListEntity> _videoList = [];
  List<VideoListEntity> get videoList => _videoList;
  int age = 12;
  Future<List> getVideoList() async {
    try {
      BaseListEntity response = await videoApi.getVideoList();
      _videoList =
          response.list.map((e) => VideoListEntity.fromJson(e)).toList();
    } catch (e) {
      _videoList = [];
    }
    notifyListeners();
    return _videoList;
  }
}
