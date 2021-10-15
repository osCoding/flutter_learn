/*
 * Created with Android Studio.
 * User: sunjian
 * Date: 2021/9/27
 * Time: 2:23 下午
 * target: 手势冲突处理 demo/// 处理 横向滑动跟 pageView 横向滑动的冲突处理
 ///
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GestureTestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureTestDemoState();
  }
}

class GestureTestDemoState extends State<GestureTestDemo> {
  final PageController controller = PageController(initialPage: 0);
  dynamic _dragDetails;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "手势测试",
      home: Scaffold(
        appBar: AppBar(title: const Text("手势测试")),
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            Center(
              child: HorizontalWrapper(
                color: Colors.cyan,
                onHorizontalDragUpdate: _update,
                onHorizontalDragStart: _start,
                onHorizontalDragEnd: _end,
                dragCallback: () {
                  DragStartDetails dragStartDetail = DragStartDetails(
                      sourceTimeStamp: _dragDetails.sourceTimeStamp,
                      localPosition: _dragDetails.localPosition,
                      globalPosition: _dragDetails.globalPosition);
                  controller.position.drag(dragStartDetail, () {});
                },
              ),
            ),
            Center(
              child: HorizontalWrapper(
                color: Colors.amberAccent,
                onHorizontalDragUpdate: _update,
                onHorizontalDragStart: _start,
                onHorizontalDragEnd: _end,
                dragCallback: () {
                  DragStartDetails dragStartDetail = DragStartDetails(
                      sourceTimeStamp: _dragDetails.sourceTimeStamp,
                      localPosition: _dragDetails.localPosition,
                      globalPosition: _dragDetails.globalPosition);
                  controller.position.drag(dragStartDetail, () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _start(DragStartDetails details) {
    _dragDetails = details;
    print("_start-----------${details.globalPosition.dx}");
  }

  void _update(DragUpdateDetails details) {
    _dragDetails = details;
    print("_update-----------${details.globalPosition.dx}");
  }

  void _end(DragEndDetails details) {
    _dragDetails = details;

    print("_end-----------${details.toString()}");
  }
}

class HorizontalWrapper extends StatefulWidget {
  final Color color;
  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureDragEndCallback onHorizontalDragEnd;
  final GestureDragCancelCallback onHorizontalDragCancel;
  final Function() dragCallback;

  HorizontalWrapper(
      {this.color,
      this.onHorizontalDragStart,
      this.onHorizontalDragDown,
      this.onHorizontalDragUpdate,
      this.onHorizontalDragCancel,
      this.onHorizontalDragEnd,
      this.dragCallback});

  @override
  State<StatefulWidget> createState() {
    return HorizontalWrapperState();
  }
}

class HorizontalWrapperState extends State<HorizontalWrapper> {
  final Map<Type, GestureRecognizerFactory> gestures =
      <Type, GestureRecognizerFactory>{};
  ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    gestures[CustomHorizontalDragGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<
            CustomHorizontalDragGestureRecognizer>(
      () => CustomHorizontalDragGestureRecognizer(),
      (CustomHorizontalDragGestureRecognizer instance) {
        instance
          ..onDown = widget.onHorizontalDragDown
          ..onStart = widget.onHorizontalDragStart
          ..onUpdate = widget.onHorizontalDragUpdate
          ..onEnd = widget.onHorizontalDragEnd
          ..onCancel = widget.onHorizontalDragCancel;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: gestures,
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels >=
                  notification.metrics.maxScrollExtent ||
              notification.metrics.pixels == 0) {
            widget.dragCallback();
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.all(16),
            width: 1200,
            height: 300,
            color: widget.color,
            child: Text(
                "这是一个test这是一个test这是一个test这是一个test这是一个test这是一个test这是一个test这是一个test这是一个test"),
          ),
        ),
      ),
    );
  }
}
