//
//  ShapeCheck.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/26.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import Foundation
import SwiftUI

struct ChampionFrame: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let points = [
            CGPoint(x: rect.width * 0.3, y: rect.width * 0),
            CGPoint(x: rect.width * 0.7, y: rect.width * 0),
            CGPoint(x: rect.width * 1, y: rect.width * 0.3),
            CGPoint(x: rect.width * 1, y: rect.width * 0.7),
            CGPoint(x: rect.width * 0.7, y: rect.width * 1),
            CGPoint(x: rect.width * 0.3, y: rect.width * 1),
            CGPoint(x: rect.width * 0, y: rect.width * 0.7),
            CGPoint(x: rect.width * 0, y: rect.width * 0.3),
        ]
        
        return Path { path in
            path.addLines(points)
            path.closeSubpath()
        }
    }
}

struct ShapeCheck: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            Text("練習シェイプ")
            ChampionFrame()
                .fill(Color.yellow)
                .cornerRadius(10)
            
        }
    }
}

struct ShapeCheck_Previews: PreviewProvider {
    static var previews: some View {
        ShapeCheck()
    }
}
