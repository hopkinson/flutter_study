// To parse this JSON data, do
//
//     final baseApiEntity = baseApiEntityFromJson(jsonString);

import 'dart:convert';

BaseApiEntity baseApiEntityFromJson(String str) =>
    BaseApiEntity.fromJson(json.decode(str));

String baseApiEntityToJson(BaseApiEntity data) => json.encode(data.toJson());

class BaseApiEntity {
  BaseApiEntity({
    this.info,
    this.rpcInfo,
    this.data,
  });

  Info info;
  dynamic rpcInfo;
  dynamic data;

  factory BaseApiEntity.fromJson(Map<String, dynamic> json) => BaseApiEntity(
        info: Info.fromJson(json["info"]),
        rpcInfo: json["rpcInfo"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "rpcInfo": rpcInfo,
        "data": data,
      };
}

class Info {
  Info({
    this.elapsed,
    this.rpcElapsed,
    this.error,
    this.message,
    this.detailMessage,
    this.traceId,
  });

  int elapsed;
  int rpcElapsed;
  int error;
  String message;
  dynamic detailMessage;
  String traceId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        elapsed: json["elapsed"],
        rpcElapsed: json["rpcElapsed"],
        error: json["error"],
        message: json["message"],
        detailMessage: json["detailMessage"],
        traceId: json["traceId"],
      );

  Map<String, dynamic> toJson() => {
        "elapsed": elapsed,
        "rpcElapsed": rpcElapsed,
        "error": error,
        "message": message,
        "detailMessage": detailMessage,
        "traceId": traceId,
      };
}
