import 'package:flutter/material.dart';
import 'package:flutter_learn/constraint_test/my_center_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyCenterWidget(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}
