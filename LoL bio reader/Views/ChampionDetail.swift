//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct ChampionDetail: View {
    var champion: Champion
    var bios: [Bio]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: true) {
            ChampionView(champion: champion)
            BioRow(
                image: champion.image,
                bios: bios.filter{$0.champion == champion.name}
                )
//            BioRow(bios: bios)
            Spacer()
            }
        .navigationBarTitle(Text("\(champion.name)"), displayMode: .inline)
        }
    }
}

struct ChampionDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.champions){champion in ChampionDetail(champion: champion, bios: dataStore.bios)}
        }
//        .previewLayout(.fixed(width: 300, height: 300))
    }
}
