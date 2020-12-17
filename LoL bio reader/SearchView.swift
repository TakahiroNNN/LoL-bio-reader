//
//  SearchView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/03.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var search_name = ""
 
    var body: some View {
        NavigationView{
            VStack {
                Text("検索するチャンピオン")
                TextField("チャンピオン名", text: $search_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
                ForEach(dataStore.champions.filter{$0.name == search_name}) { champion in
                    NavigationLink(destination: ChampionDetail(
                        champion: champion, bios: dataStore.bios.filter{$0.champion == champion.name}
                    )){
                            champion.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width * 0.8, height: width * 0.8)
                                .clipShape(ChampionClip(0.8))
                                .overlay(
                                    ChampionClip(0.8)
                                        .stroke(style: .init(lineWidth: 1.0))
                                        .fill(Color.yellow)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(style: .init(lineWidth: 0.5))
                                        .fill(Color.yellow)
                                        .frame(width: width * 0.85, height: width * 0.85)
                                )
                                .overlay(
                                    ChampionFrameBottomLarge(0.8)
                                        .stroke(style: .init(lineWidth: 0.5))
                                        .fill(Color.yellow)
                                )
                                .overlay(
                                    ChampionFrameBottomSmall(0.8)
                                        .stroke(style: .init(lineWidth: 0.5))
                                        .fill(Color.yellow)
                                )
                                .overlay(
                                    ChampionFrameTop(0.8)
                                        .stroke(style: .init(lineWidth: 0.5))
                                        .fill(Color.yellow)
                                )
                        }
                    Text("\(champion.name)")
                        .padding(.top, height/20)
                }
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
