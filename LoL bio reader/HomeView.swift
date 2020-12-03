//
//  HomeView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/03.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

let endpoint = dataStore.champions.count - 1
var champIdArray = [Int](0...endpoint)

struct HomeView: View {
    
    var hotIds: [Int] = [
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
        champIdArray.remove(at: Int.random(in: 0..<champIdArray.count)),
    ]
    
    var body: some View {
        //次のページに遷移したら、左上から戻れる階層構造を作成
        NavigationView{
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 15)
                RegionRow(regions: dataStore.regions, champions: dataStore.champions)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 30)
                ChampionRow(
                    champions: dataStore.champions.filter() { hotIds.contains($0.id) } ,
                    bios: dataStore.bios
                )
            }
        .navigationBarTitle(Text("LoL Bio Reader"), displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
