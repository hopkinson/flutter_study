// To parse this JSON data, do
//
//     final videoListEntity = videoListEntityFromJson(jsonString);

import 'dart:convert';

VideoListEntity videoListEntityFromJson(String str) =>
    VideoListEntity.fromJson(json.decode(str));

String videoListEntityToJson(VideoListEntity data) =>
    json.encode(data.toJson());

class VideoListEntity {
  VideoListEntity({
    this.commentList,
    this.likeAvatarList,
    this.isLike,
    this.platformType,
    this.likeCount,
    this.mediaId,
    this.title,
    this.content,
    this.duration,
    this.adTargetInfo,
    this.playSizeStyle,
    this.id,
    this.videoListEntityClass,
    this.memberCode,
    this.publishTime,
    this.nickName,
    this.avatar,
    this.commentCount,
    this.coverUrl,
    this.isFollow,
    this.playCount,
    this.shareTitle,
    this.isTop,
    this.shareUrl,
    this.goodsInfo,
  });

  List<CommentList> commentList;
  List<String> likeAvatarList;
  int isLike;
  int platformType;
  int likeCount;
  String mediaId;
  String title;
  String content;
  int duration;
  dynamic adTargetInfo;
  int playSizeStyle;
  int id;
  String videoListEntityClass;
  int memberCode;
  int publishTime;
  String nickName;
  String avatar;
  int commentCount;
  String coverUrl;
  int isFollow;
  int playCount;
  dynamic shareTitle;
  int isTop;
  String shareUrl;
  GoodsInfo goodsInfo;

  factory VideoListEntity.fromJson(Map<String, dynamic> json) =>
      VideoListEntity(
        commentList: json["commentList"] == null
            ? null
            : List<CommentList>.from(
                json["commentList"].map((x) => CommentList.fromJson(x))),
        likeAvatarList: json["likeAvatarList"] == null
            ? null
            : List<String>.from(json["likeAvatarList"].map((x) => x)),
        isLike: json["isLike"] == null ? null : json["isLike"],
        platformType:
            json["platformType"] == null ? null : json["platformType"],
        likeCount: json["likeCount"] == null ? null : json["likeCount"],
        mediaId: json["mediaId"] == null ? null : json["mediaId"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        duration: json["duration"] == null ? null : json["duration"],
        adTargetInfo: json["adTargetInfo"],
        playSizeStyle:
            json["playSizeStyle"] == null ? null : json["playSizeStyle"],
        id: json["id"] == null ? null : json["id"],
        videoListEntityClass: json["class"] == null ? null : json["class"],
        memberCode: json["memberCode"] == null ? null : json["memberCode"],
        publishTime: json["publishTime"] == null ? null : json["publishTime"],
        nickName: json["nickName"] == null ? null : json["nickName"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        commentCount:
            json["commentCount"] == null ? null : json["commentCount"],
        coverUrl: json["coverUrl"] == null ? null : json["coverUrl"],
        isFollow: json["isFollow"] == null ? null : json["isFollow"],
        playCount: json["playCount"] == null ? null : json["playCount"],
        shareTitle: json["shareTitle"],
        isTop: json["isTop"] == null ? null : json["isTop"],
        shareUrl: json["shareUrl"] == null ? null : json["shareUrl"],
        goodsInfo: json["goodsInfo"] == null
            ? null
            : GoodsInfo.fromJson(json["goodsInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "commentList": commentList == null
            ? null
            : List<dynamic>.from(commentList.map((x) => x.toJson())),
        "likeAvatarList": likeAvatarList == null
            ? null
            : List<dynamic>.from(likeAvatarList.map((x) => x)),
        "isLike": isLike == null ? null : isLike,
        "platformType": platformType == null ? null : platformType,
        "likeCount": likeCount == null ? null : likeCount,
        "mediaId": mediaId == null ? null : mediaId,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "duration": duration == null ? null : duration,
        "adTargetInfo": adTargetInfo,
        "playSizeStyle": playSizeStyle == null ? null : playSizeStyle,
        "id": id == null ? null : id,
        "class": videoListEntityClass == null ? null : videoListEntityClass,
        "memberCode": memberCode == null ? null : memberCode,
        "publishTime": publishTime == null ? null : publishTime,
        "nickName": nickName == null ? null : nickName,
        "avatar": avatar == null ? null : avatar,
        "commentCount": commentCount == null ? null : commentCount,
        "coverUrl": coverUrl == null ? null : coverUrl,
        "isFollow": isFollow == null ? null : isFollow,
        "playCount": playCount == null ? null : playCount,
        "shareTitle": shareTitle,
        "isTop": isTop == null ? null : isTop,
        "shareUrl": shareUrl == null ? null : shareUrl,
        "goodsInfo": goodsInfo == null ? null : goodsInfo.toJson(),
      };
}

class CommentList {
  CommentList({
    this.memberCode,
    this.howLongAgo,
    this.isForbid,
    this.createTime,
    this.nickName,
    this.videoId,
    this.avatar,
    this.id,
    this.commentListClass,
    this.content,
  });

  int memberCode;
  dynamic howLongAgo;
  dynamic isForbid;
  int createTime;
  String nickName;
  int videoId;
  String avatar;
  int id;
  String commentListClass;
  String content;

  factory CommentList.fromJson(Map<String, dynamic> json) => CommentList(
        memberCode: json["memberCode"] == null ? null : json["memberCode"],
        howLongAgo: json["howLongAgo"],
        isForbid: json["isForbid"],
        createTime: json["createTime"] == null ? null : json["createTime"],
        nickName: json["nickName"] == null ? null : json["nickName"],
        videoId: json["videoId"] == null ? null : json["videoId"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        commentListClass: json["class"] == null ? null : json["class"],
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "memberCode": memberCode == null ? null : memberCode,
        "howLongAgo": howLongAgo,
        "isForbid": isForbid,
        "createTime": createTime == null ? null : createTime,
        "nickName": nickName == null ? null : nickName,
        "videoId": videoId == null ? null : videoId,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "class": commentListClass == null ? null : commentListClass,
        "content": content == null ? null : content,
      };
}

class GoodsInfo {
  GoodsInfo({
    this.shopCode,
    this.brandName,
    this.salePrice,
    this.goodsCode2Str,
    this.shopName,
    this.targetType,
    this.videoId,
    this.title,
    this.imageUrl,
    this.goodsCode,
    this.goodsInfoClass,
    this.goodsName,
    this.targetUrl,
    this.brandCode,
  });

  int shopCode;
  dynamic brandName;
  double salePrice;
  String goodsCode2Str;
  String shopName;
  dynamic targetType;
  dynamic videoId;
  String title;
  String imageUrl;
  dynamic goodsCode;
  String goodsInfoClass;
  String goodsName;
  dynamic targetUrl;
  dynamic brandCode;

  factory GoodsInfo.fromJson(Map<String, dynamic> json) => GoodsInfo(
        shopCode: json["shopCode"] == null ? null : json["shopCode"],
        brandName: json["brandName"],
        salePrice: json["salePrice"] == null ? null : json["salePrice"],
        goodsCode2Str:
            json["goodsCode2Str"] == null ? null : json["goodsCode2Str"],
        shopName: json["shopName"] == null ? null : json["shopName"],
        targetType: json["targetType"],
        videoId: json["videoId"],
        title: json["title"] == null ? null : json["title"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        goodsCode: json["goodsCode"],
        goodsInfoClass: json["class"] == null ? null : json["class"],
        goodsName: json["goodsName"] == null ? null : json["goodsName"],
        targetUrl: json["targetUrl"],
        brandCode: json["brandCode"],
      );

  Map<String, dynamic> toJson() => {
        "shopCode": shopCode == null ? null : shopCode,
        "brandName": brandName,
        "salePrice": salePrice == null ? null : salePrice,
        "goodsCode2Str": goodsCode2Str == null ? null : goodsCode2Str,
        "shopName": shopName == null ? null : shopName,
        "targetType": targetType,
        "videoId": videoId,
        "title": title == null ? null : title,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "goodsCode": goodsCode,
        "class": goodsInfoClass == null ? null : goodsInfoClass,
        "goodsName": goodsName == null ? null : goodsName,
        "targetUrl": targetUrl,
        "brandCode": brandCode,
      };
}
