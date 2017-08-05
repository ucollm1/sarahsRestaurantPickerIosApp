//
// Created by Michael Collins on 2017/07/28.
// Copyright (c) 2017 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import UIKit

class Circle {
    var r: Double

    init(radius: Int) {
        r = Double(radius)
    }

    init(diameter: Int!) {
        var param: Double = Double(diameter)
        r = param.divided(by: 2.0)
    }

    func area() -> Double {
        return 3.1415927 * r * r
    }

    func areaAndLabel(labelControl: UILabel) -> Double {
        labelControl.text = String(3.14 * r * r)
        return 5.6
    }
}