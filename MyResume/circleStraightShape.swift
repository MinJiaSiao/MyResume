//
//  circleStraightShape.swift
//  MyResume
//
//  Created by Minjia on 2023/1/11.
//

import SwiftUI

struct circleStraightShape: Shape {
    
    enum LineStyle { case bottomHalf , full, topHalf }
    
    var lineWidth : CGFloat = 10
    var circleSize : CGFloat = 20
    var style: LineStyle = .full
    var circleYPosition : CGFloat {
        switch style {
        case .bottomHalf:
            return 0.2
        case .full:
            return 0.5
        case .topHalf:
            return 0.8
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addEllipse(in: CGRect (x: rect.midX-(circleSize / 2),
                                    y: rect.maxY * circleYPosition - circleSize / 2,
                                    width: circleSize ,
                                    height: circleSize ))
        path.addRect(CGRect(x: rect.midX-(lineWidth / 2),
                            y: style == .bottomHalf ? rect.maxY * 0.2 : rect.minY,
                            width: lineWidth,
                            height: style == .full ?  rect.height: rect.height * 0.8 ))
        
        
        return path
    }
    
    
}

struct circleStraightShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack (spacing: 0)  {
            circleStraightShape(style: .bottomHalf)
            circleStraightShape()
            circleStraightShape(style: .topHalf)
        }
        
    }
}
