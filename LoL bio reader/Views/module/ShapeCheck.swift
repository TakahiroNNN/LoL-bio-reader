//
//  ShapeCheck.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/26.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import Foundation
import SwiftUI

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
                    .clipShape(ChampionClip(0.3))
                    .overlay(
                        ChampionClip(0.3)
                            .stroke(style: .init(lineWidth: 0.5))
                            .fill(Color.yellow)
                    )
                    .overlay(
                        Circle()
                            .stroke(style: .init(lineWidth: 0.1))
                            .fill(Color.yellow)
                            .frame(width: width * 0.35, height: width * 0.35)
                    )
                    .overlay(
                        ChampionFrameBottomLarge(0.3)
                            .stroke(style: .init(lineWidth: 0.1))
                            .fill(Color.yellow)
                    )
                    .overlay(
                        ChampionFrameBottomSmall(0.3)
                            .stroke(style: .init(lineWidth: 0.1))
                            .fill(Color.yellow)
                    )
                    .overlay(
                        ChampionFrameTop(0.3)
                            .stroke(style: .init(lineWidth: 0.1))
                            .fill(Color.yellow)
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
