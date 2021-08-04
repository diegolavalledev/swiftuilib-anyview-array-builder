# Getting Started with AnyViewArrayBuilder

Declare a View that contains an array of `SwiftUI.AnyView` and initialize with the `@AnyViewArrayBuilder` property wrapper.

## Overview

Prefix the corresponding view's initializer parameter with the `@AnyViewArrayBuilder` property wrapper. It can also be applied to properties directly.

```swift
struct Count: View {

    let content: [AnyView]

    init(@AnyViewArrayBuilder _ content: () -> [AnyView]) {
      self.content = content()
    }

    var body: some View {
      Text("\(content.count)")
    }
  }
}
```

You can then initialize the `Count` view with arbitrary content. In the following example the resulting count will be 6.

```swift
Count {
  Text("")
  Color.clear
  ForEach(1 ..< 4) {
    Text("\($0)")
  }
  ZStack { }
}
```
