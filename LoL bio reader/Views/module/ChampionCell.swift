//
//  ChampionCell.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/01.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct ChampionCell: View{
    //変数定義
    var champion: Champion

    var body: some View{
        //vertical方向に並べて配置
        VStack(alignment: .center){
            //champion変数のimageプロパティ使用、「Champion.swift」内で定義
            champion.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .frame(width: 155, height: 155)
                .frame(width: 120, height: 120)
//                .clipShape(Circle())
                .clipShape(ChampionFrame())
            //champion変数のnameプロパティ使用、「Champion.swift」内で定義
            Text(champion.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}
