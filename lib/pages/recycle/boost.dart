import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';

class FirstFirstRouteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstFirstRouteWidgetState();
}

class _FirstFirstRouteWidgetState extends State<FirstFirstRouteWidget> {
  _FirstFirstRouteWidgetState();

  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(FirstFirstRouteWidget oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('[XDEBUG] - FirstFirstRouteWidget is disposing~');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: RaisedButton(
          child: const Text('Open first route'),
          onPressed: () {
            print('open first page again!');
          },
        ),
      ),
    );
  }
}
