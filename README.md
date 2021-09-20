# flutter_learn
 ## flutter 布局与绘制
 - 在performLayout方法里向child传递约束child!.layout(constraints,{bool parentUsesSize});
 - 在piant 方法中将offset传递给child，paint(PaintingContext context, Offset offset)
![image](https://user-images.githubusercontent.com/13581424/133989597-00b92408-bfb0-4f60-aee0-9e37c54f5d38.png)

![image](https://user-images.githubusercontent.com/13581424/133989637-54d46213-f476-4dfe-b19e-c9b715b5a74f.png)

文章以Container，center 为例跟进源码阐明布局与绘制：https://www.jianshu.com/p/764e8e7f659a
