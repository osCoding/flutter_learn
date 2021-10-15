/*
 * Created with Android Studio.
 * User: sunjian
 * Date: 2021/10/14
 * Time: 4:23 下午
 * target: 将共享滚动数据 包装一层
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/exposure/scoll_notification_publish.dart';

class ScrollDetailInfoProvider extends StatefulWidget {
  final Widget child;
  ScrollDetailInfoProvider({Key key, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScrollDetailInfoProviderState();
  }
}

class _ScrollDetailInfoProviderState extends State<ScrollDetailInfoProvider> {
  @override
  Widget build(BuildContext context) {
    return ScrollNotificationPublish(child: Builder(
      builder: (context) {
        postStartPosition(context);
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            return postNotification(scrollNotification, context);
          },
          child: widget.child,
        );
      },
    ));
  }

  // 首次展现需要单独发一个 Notification
  // pixels 为 0
  // 为了避免 listener 还没有监听上从而丢失第一次消息，延迟 500 ms
  void postStartPosition(BuildContext context) async {
    await Future.delayed(const Duration(microseconds: 500));
    final fakeScrollNotification = ScrollStartNotification(
      context: context,
      metrics: FixedScrollMetrics(
        minScrollExtent: 0.0,
        maxScrollExtent: 0.0,
        pixels: 0.0,
        viewportDimension: 0.0,
        axisDirection: AxisDirection.down,
      ),
    );
    ScrollNotificationPublish.of(context).add(fakeScrollNotification);
  }

  bool postNotification(
      ScrollNotification scrollNotification, BuildContext context) {
    ScrollNotificationPublish.of(context).add(scrollNotification);
    return false;
  }
}
