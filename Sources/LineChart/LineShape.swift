//
//  LineShape.swift
//
//
//  Created by Karlis Lukstins on 29/11/2020.
//

import SwiftUI

public struct LineShape: Shape {
  @ObservedObject
  var model: LineModel

  // Animated values
  var offset: CGFloat
  var currentMax: CGFloat

  public init(model: LineModel) {
    self.model = model
    offset = model.offset
    currentMax = model.currentMax
  }

  public var animatableData: AnimatablePair<CGFloat, CGFloat> {
    get { AnimatablePair(offset, currentMax) }
    set {
      offset = newValue.first
      currentMax = newValue.second
    }
  }

  public func path(in rect: CGRect) -> Path {
    let points = mapIntoPoints(
      values: model.values,
      rect: rect,
      offset: offset,
      currentMax: currentMax,
      showCount: model.showCount
    )
    return LinePath.lineChart(for: points, in: rect)
  }

  private func mapIntoPoints(
    values: [CGFloat],
    rect: CGRect,
    offset: CGFloat,
    currentMax: CGFloat,
    showCount: CGFloat
  ) -> [CGPoint] {
    let height = rect.size.height
    let width = rect.size.width

    // drop already shown items
    let offsetShown = floor(offset)
    let valuesToShow = values.dropFirst(Int(offsetShown))

    let normalized = valuesToShow
      .map { (1 - ($0 / currentMax)) * height }

    let spaceBetweenPoints = width / (showCount - 1)

    let localOffset = (offset - offsetShown) * spaceBetweenPoints

    var points: [CGPoint] = []
    for (index, value) in normalized.enumerated() {
      let x = spaceBetweenPoints * CGFloat(index) - localOffset
      let y = value
      points.append(CGPoint(x: x, y: y))
    }
    return points
  }
}
