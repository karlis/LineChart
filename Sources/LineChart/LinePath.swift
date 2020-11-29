//
//  LinePath.swift
//  
//
//  Created by Karlis Lukstins on 29/11/2020.
//

import SwiftUI

class LinePath {
  /// Line chart for given points
  static func lineChart(
    for points: [CGPoint],
    in rect: CGRect
  ) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))

    for point in points {
      path.addLine(to: point)
    }

    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

    return path
  }
}
