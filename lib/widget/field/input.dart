import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final String placeholder;

  InputComponent({Key key, this.placeholder: '请输入'}) : super(key: key);

  @override
  _InputComponentState createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextField(decoration: InputDecoration(hintText: widget.placeholder)),
      ],
    );
  }
}
