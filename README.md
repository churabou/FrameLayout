# FrameLayout


FrameLayout is framework for easy manual layout inspired by PinLayout


### easy manual layout

``` .swift
viewA.fl.top(100).left(50).size(200)
print(viewA.frame) // (50.0, 100.0, 200.0, 200.0)
```

FrameLayout changes view's frame immediately


### relative layout supports

``` .swift 
viewB.fl
      .top(to: viewA.edge.bottom)
      .left(to: viewA.edge.right, offset: 10)
      .width(100)
      .height(50)
print(viewB.frame) // (260.0, 300.0, 100.0, 50.0)
```

FrameLayout does not use AutoLayout it change view's frame based on current targetView's frame
