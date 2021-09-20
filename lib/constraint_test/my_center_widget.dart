/*
 * Created with Android Studio.
 * User: sunjian
 * Date: 2021/9/20
 * Time: 5:36 下午
 * target: 自定义一个具备center功能的Widget，简易版的Center
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCenterWidget extends SingleChildRenderObjectWidget {
  MyCenterWidget({Key key, Widget child}) : super(key: key, child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return MyCenterRenderObject();
  }
}

class MyCenterRenderObject extends RenderProxyBox {
  @override
  void performLayout() {
    if (child != null) {
      // 此处若是设置为constraints.tighten()，那么子child会强制约束，constraints.loosen()child在约束范围内的尺寸都可以
      child.layout(constraints.loosen(), parentUsesSize: false);
      size = constraints.biggest;
      // final BoxParentData childParentData = child.parentData as BoxParentData;

    } else {
      size = computeSizeForNoChild(constraints);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (constraints.smallest > Size.zero) {
      context.canvas.drawRect(
          offset & constraints.smallest, Paint()..color = Colors.cyanAccent);
    }
    if (child != null) {
      // 此处计算child的偏移量
      Offset offset = size - child.size as Offset;
      Offset childOffset = Offset(offset.dx / 2.0, offset.dy / 2.0);
      context.paintChild(child, childOffset);
    }
  }
}
