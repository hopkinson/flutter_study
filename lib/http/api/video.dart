import 'package:dio/dio.dart';

import 'package:flutter_auction_module/entity/base/list_entity.dart';
import 'package:flutter_auction_module/entity/video/video_list.dart';
import 'package:flutter_auction_module/http/utils/dio.dart';

VideoApi videoApi = new VideoApi();

// 视频类
class VideoApi {
  static const String GET_VIDEO_LIST = "/app/ugc/video/homeVideoList";

  // 获取视频列表
  Future<BaseListEntity> getVideoList() async {
    var response = await httpUtils.request(url: GET_VIDEO_LIST, method: "post");
    BaseListEntity result = BaseListEntity.fromJson(response);
    return result;
  }
}
