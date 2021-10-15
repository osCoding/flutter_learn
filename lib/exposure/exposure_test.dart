/*
 * Created with Android Studio.
 * User: sunjian
 * Date: 2021/10/14
 * Time: 3:10 下午
 * target: 滚动曝光 测试
 */

import 'package:flutter/material.dart';
import 'package:flutter_exposure/exposure.dart';
import 'package:flutter_exposure/list/scroll_detail_provider.dart';

class ExposurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollDetailProvider(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Exposure(
              child: ItemCard(index),
              onExpose: () {
                print("index;$index");
              },
              onHide: (duration) {
                print("duration:$duration,$index");
              },
            );
          },
          itemCount: 40,
          cacheExtent: 0,
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final int index;
  ItemCard(this.index, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ItemCardState();
  }
}

class _ItemCardState extends State<ItemCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("exposure--->${widget.index}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Text(
        "测试${widget.index}",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
