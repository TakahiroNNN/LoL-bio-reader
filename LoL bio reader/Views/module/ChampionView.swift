//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

//fileprivate let gradient = Gradient(colors: [.black, Color.init(red: 0.9, green: 0.9, blue: 0.9)])
fileprivate let gradient = Gradient(stops: [.init(color: .black, location: 0.0), .init(color: .clear, location: 0.5)])
fileprivate let linear = LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)

let width = UIScreen.main.bounds.size.width

struct ChampionView: View {
    var champion: Champion
    
    var body: some View {
        ZStack(alignment: .leading){
            champion.image
                .resizable()
                .scaledToFit()
                .frame(width: width)
                .overlay(Rectangle().fill(linear).opacity(1))
            VStack{
                champion.icon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                Text(champion.region)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

struct ChampionView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.champions){champion in ChampionView(champion: champion)}
        }
//        .previewLayout(.fixed(width: 300, height: 300))
    }
}
