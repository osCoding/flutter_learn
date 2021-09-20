# flutter_learn
 ## flutter 布局与绘制
 - 在performLayout方法里向child传递约束child!.layout(constraints,{bool parentUsesSize});
 - 在piant 方法中将offset传递给child，paint(PaintingContext context, Offset offset)
 ![image.png](https://upload-images.jianshu.io/upload_images/16314761-c32741263d0f9b83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/16314761-7e3d83f4faf0cc7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

文章以Container，center 为例跟进源码阐明布局与绘制：https://www.jianshu.com/p/764e8e7f659a
