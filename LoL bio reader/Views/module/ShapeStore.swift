//
//  ShapeStore.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/12/05.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import Foundation
import SwiftUI

struct RegionFrame: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let points = [
            CGPoint(x: rect.width * -0.015, y: rect.height * 0.1),
            CGPoint(x: rect.height * 0.1, y: rect.width * -0.015),
            CGPoint(x: rect.width * 1.015, y: rect.width * -0.015),
            CGPoint(x: rect.width * 1.015, y: rect.height * 0.9),
            CGPoint(x: rect.width * 1 - rect.height * 0.1, y: rect.height * 1 + rect.width * 0.015),
            CGPoint(x: rect.width * -0.015, y: rect.height * 1 + rect.width * 0.015),
//            CGPoint(x: rect.width * 1.015, y: rect.width * -0.015),
//            CGPoint(x: rect.width * 1.015, y: rect.height * 0.9),
        ]
        
        return Path { path in
            path.addLines(points)
            path.closeSubpath()
        }
    }
}

struct ChampionFrameBottomLarge: Shape {
    var frameratio = 1.0
    
    init(_ frameratio:Double=1.0){
        self.frameratio = frameratio
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width/2, y: rect.height/2),
                radius: width * CGFloat(Double(frameratio)) * 0.5 * 0.95 ,
                startAngle: .degrees(5.0),
                endAngle: .degrees(175.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5,
                startAngle: .degrees(180.0),
                endAngle: .degrees(0.0),
                clockwise: true
                )
            path.closeSubpath()
        }
    }
}

struct ChampionFrameBottomSmall: Shape {
    var frameratio = 1.0
    
    init(_ frameratio:Double=1.0){
        self.frameratio = frameratio
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5 * 0.9,
                startAngle: .degrees(40.0),
                endAngle: .degrees(140.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5,
                startAngle: .degrees(142.0),
                endAngle: .degrees(38.0),
                clockwise: true
                )
            path.closeSubpath()
        }
    }
}

struct ChampionFrameTop: Shape {
    var frameratio = 1.0
    
    init(_ frameratio:Double=1.0){
        self.frameratio = frameratio
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5 * 0.95,
                startAngle: .degrees(-120.0),
                endAngle: .degrees(-60.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5,
                startAngle: .degrees(-58.0),
                endAngle: .degrees(-122.0),
                clockwise: false
                )
            path.closeSubpath()
        }
    }
}

struct ChampionClip: Shape {
    var frameratio = 1.0
    
    init(_ frameratio:Double=1.0){
        self.frameratio = frameratio
    }
    
    func path(in rect: CGRect) -> Path {
        
        let point1 = [
            CGPoint(x: rect.width/2, y: rect.width/10),
        ]
        
        return Path { path in
            path.addLines(point1)
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * CGFloat(Double(frameratio)) * 0.5,
                startAngle: .degrees(-85.0),
                endAngle: .degrees(-95.0),
                clockwise: false
                )
            path.closeSubpath()
        }
    }
}
