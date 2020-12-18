//
//  CustomShape.swift
//  UI-77
//
//  Created by にゃんにゃん丸 on 2020/12/18.
//

import SwiftUI

struct CustomShape: Shape {
    var xAxis : CGFloat
    var animationtable:CGFloat{
        
        get{return xAxis}
        set{xAxis = newValue}
    }
    func path(in rect: CGRect) -> Path {
       
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x:center - 50, y: 0))
            
            
            let to1 = CGPoint(x: center, y: 35)
            let controller1 = CGPoint(x: center - 25, y: 0)
            let controller2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let controller3 = CGPoint(x: center + 25, y: 35)
            let controller4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: controller1, control2: controller2)
            path.addCurve(to: to2, control1: controller3, control2: controller4)
        
            
            
        }
    }
}

