//
//  CircleView.swift
//  FitnessApp
//
//  Created by 123 on 7.09.23.
//

import UIKit
import SnapKit


class CircleView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            
            let circleRect = CGRect(x: 50, y: 50, width: 1000, height: 1000)
            
            //context.setFillColor(UIColor.systemBlue.cgColor)
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(5.0)
            
            
            
            context.addEllipse(in: circleRect)
            context.drawPath(using: .fillStroke)
        }
            
    }
}
