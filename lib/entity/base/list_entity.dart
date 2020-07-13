// To parse this JSON data, do
//
//     final baseListEntity = baseListEntityFromJson(jsonString);

import 'dart:convert';

BaseListEntity baseListEntityFromJson(String str) =>
    BaseListEntity.fromJson(json.decode(str));

String baseListEntityToJson(BaseListEntity data) => json.encode(data.toJson());

class BaseListEntity {
  BaseListEntity({
    this.pager,
    this.list,
    this.baseListEntityClass,
  });

  Pager pager;
  List list;
  String baseListEntityClass;

  factory BaseListEntity.fromJson(Map<String, dynamic> json) => BaseListEntity(
        pager: Pager.fromJson(json["pager"]),
        list: List.from(json["list"].map((x) => x)),
        baseListEntityClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "pager": pager.toJson(),
        "list": List.from(list.map((x) => x)),
        "class": baseListEntityClass,
      };
}

class Pager {
  Pager({
    this.total,
    this.size,
    this.now,
    this.pagerClass,
  });

  int total;
  int size;
  int now;
  String pagerClass;

  factory Pager.fromJson(Map<String, dynamic> json) => Pager(
        total: json["total"],
        size: json["size"],
        now: json["now"],
        pagerClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "size": size,
        "now": now,
        "class": pagerClass,
      };
}
