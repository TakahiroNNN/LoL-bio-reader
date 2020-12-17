//
//  ChampionImage.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct ChampionImage: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width * 0.32, height: width * 0.32)
            .clipShape(ChampionClip(0.3))
            .overlay(
                ChampionClip(0.3)
                    .stroke(style: .init(lineWidth: 0.5))
                    .fill(Color.yellow)
            )
            .overlay(
                Circle()
                    .stroke(style: .init(lineWidth: 0.3))
                    .fill(Color.yellow)
                    .frame(width: width * 0.32, height: width * 0.32)
            )
            .overlay(
                ChampionFrameBottomLarge(0.3)
                    .stroke(style: .init(lineWidth: 0.3))
                    .fill(Color.yellow)
            )
            .overlay(
                ChampionFrameBottomSmall(0.3)
                    .stroke(style: .init(lineWidth: 0.3))
                    .fill(Color.yellow)
            )
            .overlay(
                ChampionFrameTop(0.3)
                    .stroke(style: .init(lineWidth: 0.3))
                    .fill(Color.yellow)
            )
    }
}

struct ChampionImage_Previews: PreviewProvider {
    static var previews: some View {
        ChampionImage(image: dataStore.champions[1].image)
//        .previewLayout(.fixed(width: 300, height: 300))
    }
}
