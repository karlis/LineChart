//
//  LineModel.swift
//
//
//  Created by Karlis Lukstins on 29/11/2020.
//

import Foundation

import SwiftUI

public class LineModel: ObservableObject {
  @Published
  public var values: [CGFloat]
  @Published
  public var offset: CGFloat
  @Published
  public var currentMax: CGFloat
  // How many values to show on Graph
  public let showCount: CGFloat

  public init(
    showCount: CGFloat = 5
  ) {
    self.showCount = showCount
    _values = .init(initialValue: Array(repeating: 0, count: Int(showCount)))
    _offset = .init(initialValue: 0)
    _currentMax = .init(initialValue: 0)
  }

  public func add(_ value: CGFloat) {
    withAnimation(.linear) {
      values.append(value)
      offset = CGFloat(values.count - Int(showCount))
      currentMax = values.suffix(Int(showCount)).max() ?? 1
    }
  }
}
