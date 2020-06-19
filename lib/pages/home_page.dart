import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// 页面(滚动)
class _HomePageState extends State<HomePage> {
  // 透明度
  double alpha = 0.0;
  // 监听滚动的动作
  _onScroll(offset) {
    double _alpha = offset > 100 ? 1.0 : offset / 100;
    setState(() {
      alpha = _alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        // 列表滚动中 && 第一个元素才打印
        if (notification is ScrollUpdateNotification &&
            notification.depth == 0) {
          _onScroll(notification.metrics.pixels);
        }
      },
      child: Scaffold(body: PageContent(opacity: alpha)),
    );
  }
}

class PageContent extends StatelessWidget {
  final opacity;

  const PageContent({Key key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[BodyContent(), BarContent(opacity: opacity)],
    );
  }
}

// 页面内容
class BodyContent extends StatelessWidget {
  const BodyContent({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removeViewPadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            Container(
                height: 250,
                child: SwiperContent(
                  imgUrl: [
                    'https://image7.wbiao.co/mall/4a8e381fe5374123a1e719d6bf4d2e9b.jpg',
                    'https://image7.wbiao.co/mall/745820df41ea46a39dc946135a857952.jpg',
                    'https://image7.wbiao.co/mall/977b1ac7f14d47538a4fb5f94be661c3.jpg',
                    'https://image7.wbiao.co/mall/47ed01dbb80e451aabbc447552de0d46.jpeg'
                  ],
                )),
            Container(
              height: 800,
              child: ListTile(title: Text('332')),
            )
          ],
        ));
  }
}

class BarContent extends StatelessWidget {
  final opacity;
  const BarContent({Key key, this.opacity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity,
        child: Container(
          height: 60.0,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text('万表网'),
            ),
          ),
        ));
  }
}

// 轮播
class SwiperContent extends StatelessWidget {
  final List imgUrl;
  SwiperContent({Key key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: imgUrl.length,
      autoplay: true,
      itemBuilder: (context, index) {
        return Image.network(
          imgUrl[index] + '?x-oss-process=image/resize,m_fill,h_750,w_1125',
          fit: BoxFit.fill,
        );
      },
      pagination: SwiperPagination(),
    );
  }
}
