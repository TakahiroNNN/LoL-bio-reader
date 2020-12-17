//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct RegionDetail: View {
    var region: Region
    var champions: [Champion]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: true) {
                RegionView(region: region)
                
                if region.content != ""{
                    Text(region.content)
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.vertical)
                        .padding(.horizontal, width/12)
                }
                ChampionRow(champions: champions.filter{
                        $0.region == region.name
                }, bios: dataStore.bios)
            }
        }
        .navigationBarTitle(Text("\(region.name)"), displayMode: .inline)
    }
}

struct RegionDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.regions){region in RegionDetail(
                region: region, champions: dataStore.champions
            )}
        }
//        .previewLayout(.fixed(width: 300, height: 300))
    }
}
