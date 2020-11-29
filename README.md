# LineChart

A simple animated LineChart example.


```swift
import SwiftUI

struct ExampleView: View {
  @ObservedObject
  var model = LineModel()

  var body: some View {
    Color.white
      .overlay(
        LineShape(model: model)
          .fill(gradient)
      )
      .onTapGesture {
        withAnimation {
          model.add(CGFloat.random(in: 0...100))
        }
      }
  }

  var gradient: LinearGradient {
    LinearGradient(
      gradient: Gradient(colors: [Color.green, Color.green.opacity(0.2)]),
      startPoint: .top,
      endPoint: .bottom
    )
  }
}
```
