import 'package:flutter_auction_module/properties/config.dart';
import 'config.dev.dart';

// ignore: todo
// TODO: 区分环境

// import './config.prod.dart';
// , ProductionConfig

class AllConfig with CommonConfig, DevelopmentConfig {}

AllConfig config = new AllConfig();
