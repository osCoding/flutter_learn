/*
 * Created with Android Studio.
 * User: sunjian
 * Date: 2021/10/14
 * Time: 4:15 下午
 * target: 将滚动视图 ScrollNotification 对象共享给子Widget
 */
import 'dart:async';

import 'package:flutter/material.dart';

class ScrollNotificationPublish extends InheritedWidget {
  ScrollNotificationPublish({Key key, @required Widget child})
      : super(key: key, child: child);

  final StreamController<ScrollNotification> scrollNotificationController =
      StreamController<ScrollNotification>.broadcast();

  static StreamController<ScrollNotification> of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<ScrollNotificationPublish>())
        .scrollNotificationController;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
