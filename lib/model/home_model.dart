// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.config,
    this.bannerList,
    this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBox,
  });

  Config config;
  List<BannerList> bannerList;
  List<LocalNavList> localNavList;
  GridNav gridNav;
  List<BigCard1> subNavList;
  SalesBox salesBox;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        config: Config.fromJson(json["config"]),
        bannerList: List<BannerList>.from(
            json["bannerList"].map((x) => BannerList.fromJson(x))),
        localNavList: List<LocalNavList>.from(
            json["localNavList"].map((x) => LocalNavList.fromJson(x))),
        gridNav: GridNav.fromJson(json["gridNav"]),
        subNavList: List<BigCard1>.from(
            json["subNavList"].map((x) => BigCard1.fromJson(x))),
        salesBox: SalesBox.fromJson(json["salesBox"]),
      );

  Map<String, dynamic> toJson() => {
        "config": config.toJson(),
        "bannerList": List<dynamic>.from(bannerList.map((x) => x.toJson())),
        "localNavList": List<dynamic>.from(localNavList.map((x) => x.toJson())),
        "gridNav": gridNav.toJson(),
        "subNavList": List<dynamic>.from(subNavList.map((x) => x.toJson())),
        "salesBox": salesBox.toJson(),
      };
}

class BannerList {
  BannerList({
    this.icon,
    this.url,
  });

  String icon;
  String url;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        icon: json["icon"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "url": url,
      };
}

class Config {
  Config({
    this.searchUrl,
  });

  String searchUrl;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        searchUrl: json["searchUrl"],
      );

  Map<String, dynamic> toJson() => {
        "searchUrl": searchUrl,
      };
}

class GridNav {
  GridNav({
    this.hotel,
    this.flight,
    this.travel,
  });

  Hotel hotel;
  Flight flight;
  Travel travel;

  factory GridNav.fromJson(Map<String, dynamic> json) => GridNav(
        hotel: Hotel.fromJson(json["hotel"]),
        flight: Flight.fromJson(json["flight"]),
        travel: Travel.fromJson(json["travel"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel": hotel.toJson(),
        "flight": flight.toJson(),
        "travel": travel.toJson(),
      };
}

class Flight {
  Flight({
    this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });

  String startColor;
  String endColor;
  BigCard1 mainItem;
  LocalNavList item1;
  Item2 item2;
  LocalNavList item3;
  LocalNavList item4;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
        startColor: json["startColor"],
        endColor: json["endColor"],
        mainItem: BigCard1.fromJson(json["mainItem"]),
        item1: LocalNavList.fromJson(json["item1"]),
        item2: Item2.fromJson(json["item2"]),
        item3: LocalNavList.fromJson(json["item3"]),
        item4: LocalNavList.fromJson(json["item4"]),
      );

  Map<String, dynamic> toJson() => {
        "startColor": startColor,
        "endColor": endColor,
        "mainItem": mainItem.toJson(),
        "item1": item1.toJson(),
        "item2": item2.toJson(),
        "item3": item3.toJson(),
        "item4": item4.toJson(),
      };
}

class LocalNavList {
  LocalNavList({
    this.title,
    this.url,
    this.hideAppBar,
    this.statusBarColor,
    this.icon,
  });

  String title;
  String url;
  bool hideAppBar;
  String statusBarColor;
  String icon;

  factory LocalNavList.fromJson(Map<String, dynamic> json) => LocalNavList(
        title: json["title"],
        url: json["url"],
        hideAppBar: json["hideAppBar"],
        statusBarColor:
            json["statusBarColor"] == null ? null : json["statusBarColor"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "hideAppBar": hideAppBar,
        "statusBarColor": statusBarColor == null ? null : statusBarColor,
        "icon": icon == null ? null : icon,
      };
}

class Item2 {
  Item2({
    this.title,
    this.url,
  });

  String title;
  String url;

  factory Item2.fromJson(Map<String, dynamic> json) => Item2(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}

class BigCard1 {
  BigCard1({
    this.title,
    this.icon,
    this.url,
    this.hideAppBar,
  });

  String title;
  String icon;
  String url;
  bool hideAppBar;

  factory BigCard1.fromJson(Map<String, dynamic> json) => BigCard1(
        title: json["title"],
        icon: json["icon"],
        url: json["url"],
        hideAppBar: json["hideAppBar"] == null ? null : json["hideAppBar"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "url": url,
        "hideAppBar": hideAppBar == null ? null : hideAppBar,
      };
}

class Hotel {
  Hotel({
    this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });

  String startColor;
  String endColor;
  Item1 mainItem;
  Item1 item1;
  Item2 item2;
  LocalNavList item3;
  LocalNavList item4;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        startColor: json["startColor"],
        endColor: json["endColor"],
        mainItem: Item1.fromJson(json["mainItem"]),
        item1: Item1.fromJson(json["item1"]),
        item2: Item2.fromJson(json["item2"]),
        item3: LocalNavList.fromJson(json["item3"]),
        item4: LocalNavList.fromJson(json["item4"]),
      );

  Map<String, dynamic> toJson() => {
        "startColor": startColor,
        "endColor": endColor,
        "mainItem": mainItem.toJson(),
        "item1": item1.toJson(),
        "item2": item2.toJson(),
        "item3": item3.toJson(),
        "item4": item4.toJson(),
      };
}

class Item1 {
  Item1({
    this.title,
    this.url,
    this.statusBarColor,
    this.icon,
  });

  String title;
  String url;
  String statusBarColor;
  String icon;

  factory Item1.fromJson(Map<String, dynamic> json) => Item1(
        title: json["title"],
        url: json["url"],
        statusBarColor: json["statusBarColor"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "statusBarColor": statusBarColor,
        "icon": icon == null ? null : icon,
      };
}

class Travel {
  Travel({
    this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });

  String startColor;
  String endColor;
  LocalNavList mainItem;
  LocalNavList item1;
  LocalNavList item2;
  LocalNavList item3;
  LocalNavList item4;

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        startColor: json["startColor"],
        endColor: json["endColor"],
        mainItem: LocalNavList.fromJson(json["mainItem"]),
        item1: LocalNavList.fromJson(json["item1"]),
        item2: LocalNavList.fromJson(json["item2"]),
        item3: LocalNavList.fromJson(json["item3"]),
        item4: LocalNavList.fromJson(json["item4"]),
      );

  Map<String, dynamic> toJson() => {
        "startColor": startColor,
        "endColor": endColor,
        "mainItem": mainItem.toJson(),
        "item1": item1.toJson(),
        "item2": item2.toJson(),
        "item3": item3.toJson(),
        "item4": item4.toJson(),
      };
}

class SalesBox {
  SalesBox({
    this.icon,
    this.moreUrl,
    this.bigCard1,
    this.bigCard2,
    this.smallCard1,
    this.smallCard2,
    this.smallCard3,
    this.smallCard4,
  });

  String icon;
  String moreUrl;
  BigCard1 bigCard1;
  BigCard1 bigCard2;
  BigCard1 smallCard1;
  BigCard1 smallCard2;
  BigCard1 smallCard3;
  BigCard1 smallCard4;

  factory SalesBox.fromJson(Map<String, dynamic> json) => SalesBox(
        icon: json["icon"],
        moreUrl: json["moreUrl"],
        bigCard1: BigCard1.fromJson(json["bigCard1"]),
        bigCard2: BigCard1.fromJson(json["bigCard2"]),
        smallCard1: BigCard1.fromJson(json["smallCard1"]),
        smallCard2: BigCard1.fromJson(json["smallCard2"]),
        smallCard3: BigCard1.fromJson(json["smallCard3"]),
        smallCard4: BigCard1.fromJson(json["smallCard4"]),
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "moreUrl": moreUrl,
        "bigCard1": bigCard1.toJson(),
        "bigCard2": bigCard2.toJson(),
        "smallCard1": smallCard1.toJson(),
        "smallCard2": smallCard2.toJson(),
        "smallCard3": smallCard3.toJson(),
        "smallCard4": smallCard4.toJson(),
      };
}
