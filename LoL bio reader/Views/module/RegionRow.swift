//
//  RegionRow.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct RegionRow: View {
    //保存したデータから複数使用するので、関数内で複数の変数を定義
    var regions: [Region]
    var champions: [Champion]
    
    var body: some View {
        //vertical方向に並べて配置
        VStack(alignment: .leading) {
            //テキスト（サブタイトル）
            Text("地域")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            //地域画像のスクロールをhorizon方向に許可
            ScrollView(.horizontal, showsIndicators: true) {
                //horizontal方向に並べて配置
                HStack(alignment: .top, spacing: 0) {
                    //自構造体の複数変数championsをひとつずつ使用して繰り返し
                    ForEach(self.regions) {
                        //NavigationLinkに変数代入、リンク先はChampionView（champion仮引数にchampion変数代入）
                        region in NavigationLink(destination: RegionDetail(region: region, champions: champions)){
                        //ボタンのラベルはchampionCellを使用(champion仮引数にchampion変数代入)
                        //このViewの定義は上記
                        RegionCell(region: region)
                        }
                        .padding(.bottom)
                    }
                }
            }.padding(.top, -5)
        }
    }
}

struct RegionRow_Previews: PreviewProvider {
    static var previews: some View {
        RegionRow(regions: dataStore.regions, champions: dataStore.champions)
    }
}
