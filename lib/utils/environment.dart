import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

class Environment {
  // 获取系统版本名称
  static getVersionName() async {
    String deviceName;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceName = data.name;
    }
    return deviceName;
  }

// 获取系统版本
  static getVersion() async {
    String deviceVersion;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceVersion = build.model;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceVersion = data.model;
    }
    return deviceVersion;
  }

// 获取UUid
  static getUUid() async {
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor;
    }
    return identifier;
  }

// 获取版本号
  static getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
