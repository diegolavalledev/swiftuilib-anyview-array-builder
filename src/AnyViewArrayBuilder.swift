import SwiftUI

/// Use to convert view body content into `[AnyView]`.
///
/// Prefix the corresponding parameter with the `@AnyViewArrayBuilder` property wrapper.
///
/// ```swift
/// func count(@AnyViewArrayBuilder _ content: () -> [AnyView]) -> Int {
///   content().count
/// }
/// ```
///
/// You can then call `count()` with arbitrary _SwiftUI_ content. In the following example the resulting count will be 7.
///
/// ```swift
/// count {
///   Text("") // 1
///   Color.clear // 1
///   EmptyView // 1
///   ForEach(1 ..< 4) { Text("\($0)") } // 3
///   ZStack { } // 1
/// } // 7
/// ```
@resultBuilder public enum AnyViewArrayBuilder {

  public static func buildBlock() -> [AnyView] {
    []
  }
  public static func buildBlock(_ components: AnyView...) -> [AnyView] {
    components
  }

  /// Allows for mixing of individual Views together with `ForEach` loops.
  ///
  /// Example:
  ///
  /// ```swift
  /// SomeView {
  ///   …
  ///   Text("") // Individual view
  ///   …
  ///   ForEach { … } // Multiple views
  ///   …
  /// }
  public static func buildBlock(_ components: [AnyView]...) -> [AnyView] {
    components.flatMap {
      $0
    }
  }

  public static func buildExpression<V: View>(_ expression: V) -> [AnyView] {
    [AnyView(expression)]
  }

  /// Allows for index-based `ForEach` loops.
  ///
  /// Example:
  ///
  /// ```swift
  /// SomeView {
  ///   …
  ///   ForEach(1 ..< 4) { index in
  ///     …
  ///   }
  ///   …
  /// }
  public static func buildExpression<V: View>(_ expression: ForEach<Range<Int>, Int, V>) -> [AnyView] {
    expression.data.map {
      AnyView(expression.content($0))
    }
  }
}
