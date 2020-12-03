//
//  ChampionImage.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

//fileprivate let gradient = Gradient(colors: [.white,
//    Color.init(red: 0.9, green: 0.9, blue: 0.9)])
//fileprivate let linear = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)

struct ChampionImage: View {
    let image: Image
    
    var body: some View {
        image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 250, height: 250)
        .clipShape(Circle())
//        .overlay(Circle().stroke(linear, lineWidth: 13))
    }
}

struct ChampionImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.champions){champion in ChampionImage(image: champion.image)}
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
