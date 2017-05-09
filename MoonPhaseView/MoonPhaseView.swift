//
//  MoonPhaseView.swift
//  MoonPhaseView
//
//  Created by Kyusaku Mihara on 5/9/17.
//  Copyright © 2017 epohsoft. All rights reserved.
//

import UIKit

@IBDesignable class MoonPhaseView: UIView {

    @IBInspectable var age: Double = 3.3 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)

        let a: CGFloat = 0.5522847
        let moonGrow = age > 15

        let moonR: CGFloat = 100.0
        let rate = CGFloat(cos(age / 30 * Double.pi * 2))
        let moonX = (moonR * rate * (moonGrow ? 1 : -1)) * -1

        let path = UIBezierPath()

        path.addArc(
            withCenter: center,
            radius:     moonR,
            startAngle: CGFloat(Double.pi / 2),
            endAngle:   CGFloat(Double.pi * 3 / 2),
            clockwise:  moonGrow
        )

        path.addCurve(
            to:            CGPoint(x: center.x + moonX,     y: center.y),
            controlPoint1: CGPoint(x: center.x + a * moonX, y: center.y - moonR),
            controlPoint2: CGPoint(x: center.x + moonX,     y: center.y - a * moonR)
        )

        path.addCurve(
            to:            CGPoint(x: center.x,             y: center.y + moonR),
            controlPoint1: CGPoint(x: center.x + moonX,     y: center.y + a * moonR),
            controlPoint2: CGPoint(x: center.x + a * moonX, y: center.y + moonR)
        )

        path.close()
        path.addClip()

        UIColor.orange.setStroke()
        UIColor.yellow.setFill()

        path.lineWidth = 1

        path.fill()
    }
}
