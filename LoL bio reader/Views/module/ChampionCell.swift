//
//  ChampionCell.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/01.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct ChampionCell: View{
    var champion: Champion

    var body: some View{
        VStack(alignment: .center){
            ChampionImage(image: champion.image)
            Text(champion.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading)
    }
}
