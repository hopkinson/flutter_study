import 'package:flutter/material.dart';

class DebugPage extends StatelessWidget {
  final String title;
  const DebugPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
