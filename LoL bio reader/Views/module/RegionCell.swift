//
//  RegionCell.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/01.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct RegionCell: View{
    //変数定義
    var region: Region

    var body: some View{
        //vertical方向に並べて配置
        VStack(alignment: .center){
            RegionImage(icon: region.icon, image: region.image)
            Text(region.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}
