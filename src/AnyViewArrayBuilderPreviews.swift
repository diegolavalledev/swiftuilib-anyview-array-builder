import SwiftUI

struct AnyViewArrayBuilderPreviews: PreviewProvider {

  private struct Count: View {

    let content: [AnyView]

    init(@AnyViewArrayBuilder _ content: () -> [AnyView]) {
      self.content = content()
    }

    var body: some View {
      Text("\(content.count)")
    }
  }

  static var previews: some View {
    Group {
      Count { } // 0

      Count {
        EmptyView()
      } // 1

      Count {
        Text("")
        Color.clear
      } // 2

      Count {
        Text("")
        Color.clear
        ForEach(1 ..< 4) {
          Text("\($0)")
        }
        ZStack { }
      } // 6
    }
    .previewLayout(.sizeThatFits)
  }
}
