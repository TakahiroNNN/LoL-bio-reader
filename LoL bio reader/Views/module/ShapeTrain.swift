//
//  ShapeStore.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/12/05.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import Foundation
import SwiftUI

struct ChampionFrameBottomLarge: Shape {
    var ratio = 1.0
    
    init(_ ratio:Double=1.0){
        self.ratio = ratio
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width/2, y: rect.height/2),
                radius: width * 0.5 * 0.95 * CGFloat(Int(ratio)),
                startAngle: .degrees(5.0),
                endAngle: .degrees(175.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width * 0.5,
                startAngle: .degrees(180.0),
                endAngle: .degrees(0.0),
                clockwise: true
                )
            path.closeSubpath()
        }
    }
}

struct ChampionFrameBottomSmall: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width*0.4*0.9,
                startAngle: .degrees(40.0),
                endAngle: .degrees(140.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width*0.4,
                startAngle: .degrees(142.0),
                endAngle: .degrees(38.0),
                clockwise: true
                )
            path.closeSubpath()
        }
    }
}

struct ChampionFrameTop: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width*0.4*0.95,
                startAngle: .degrees(-120.0),
                endAngle: .degrees(-60.0),
                clockwise: false
                )
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width*0.4,
                startAngle: .degrees(-58.0),
                endAngle: .degrees(-122.0),
                clockwise: false
                )
            path.closeSubpath()
        }
    }
}

struct ChampionClip: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let point1 = [
            CGPoint(x: rect.width/2, y: rect.width/16),
        ]
        
        return Path { path in
            path.addLines(point1)
            path.addArc(
                center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                radius: width*0.4,
                startAngle: .degrees(-85.0),
                endAngle: .degrees(-95.0),
                clockwise: false
                )
            path.closeSubpath()
        }
    }
}

struct ShapeCheck: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            Text("練習シェイプ")
            ZStack(alignment: .center){
                Image("aatrox")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width * 0.3, height: width * 0.3)
//                    .clipShape(Circle())
                    .clipShape(ChampionClip())
                    .overlay(
                        ChampionClip()
                            .stroke(style: .init(lineWidth: 1))
                            .fill(Color.yellow)
                            .frame(width: width * 0.3, height: width * 0.3)
                    )
                    .overlay(
                        Circle()
                            .stroke(style: .init(lineWidth: 0.5))
                            .fill(Color.yellow)
                            .frame(width: width * 0.35, height: width * 0.35)
                    )
                    .overlay(
                        ChampionFrameBottomLarge(0.3)
                            .stroke(style: .init(lineWidth: 0.5))
                            .fill(Color.yellow)
                            .frame(width: width * 0.3, height: width * 0.3)
                    )
                    .overlay(
                        ChampionFrameBottomSmall()
                            .stroke(style: .init(lineWidth: 0.5))
                            .fill(Color.yellow)
                            .frame(width: width * 0.3, height: width * 0.3)
                    )
                    .overlay(
                        ChampionFrameTop()
                            .stroke(style: .init(lineWidth: 0.5))
                            .fill(Color.yellow)
                            .frame(width: width * 0.3, height: width * 0.3)
                    )
            }
        }
    }
}

struct ShapeCheck_Previews: PreviewProvider {
    static var previews: some View {
        ShapeCheck()
    }
}
