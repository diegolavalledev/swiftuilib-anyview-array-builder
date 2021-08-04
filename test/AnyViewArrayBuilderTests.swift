import XCTest
import SwiftUI

import SwiftUILib_AnyViewArrayBuilder

final class AnyViewArrayBuilderTests: XCTestCase {

  func testCounts() throws {

    func count(@AnyViewArrayBuilder _ content: () -> [AnyView]) -> Int {
      content().count
    }

    XCTAssertEqual(count { }, 0)

    XCTAssertEqual(count {
      Text("")
    }, 1)

    XCTAssertEqual(count {
      Text("")
      Color.clear
    }, 2)

    // The contents of the ForEach must be counted individually
    XCTAssertEqual(count {
      Text("")
      Color.clear
      ForEach(1..<4) {
        Text("\($0)")
      }
    }, 5)
  }
}
