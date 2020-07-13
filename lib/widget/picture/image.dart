import 'package:flutter/material.dart';
import 'package:flutter_auction_module/properties/index.dart';

class ImageComponent extends StatefulWidget {
  final String src;
  final BoxFit fit;
  // final lazyLoad;
  final bool circle;
  // final errorSrc;
  final String parameter;
  final String originType;
  final Function onTap;
  ImageComponent(
      {Key key,
      @required this.src,
      this.fit: BoxFit.fill,
      this.circle: true,
      this.parameter: '',
      this.originType: 'default',
      this.onTap})
      : super(key: key);

  @override
  _ImageComponentState createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  Widget build(BuildContext context) {
    // OSS参数设置
    String _parameter =
        widget.parameter ?? '?x-oss-process=image/resize,' + widget.parameter;
    // OSS域名选择
    Map<String, dynamic> originType = {
      "static": config.ossStatic,
      "hide": '',
      "default": config.oss
    };
    // 改造过的src地址
    String _src = originType[widget.originType] + widget.src + _parameter;
    return GestureDetector(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(_src), fit: widget.fit),
            shape: widget.circle ? BoxShape.circle : BoxShape.rectangle),
      ),
      onTap: widget.onTap,
    );
  }
}
