//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct ChampionRow: View {
    //保存したデータから複数使用するので、関数内で複数の変数を定義
    var champions: [Champion]
    var bios: [Bio]
    
    var body: some View {
        //vertical方向に並べて配置
        VStack(alignment: .leading) {
            //テキスト（サブタイトル）
            Text("チャンピオン")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            //チャンピオン画像のスクロールをhorizon方向に許可
            ScrollView(.horizontal, showsIndicators: false) {
                //horizontal方向に並べて配置
                HStack(alignment: .top, spacing: 0) {
                    //自構造体の複数変数championsをひとつずつ使用して繰り返し
                    ForEach(self.champions) {
                        //NavigationLinkに変数代入、リンク先はChampionView（champion仮引数にchampion変数代入）
                        champion in NavigationLink(destination: ChampionDetail(champion: champion, bios: bios)){
                        //ボタンのラベルはchampionCellを使用(champion仮引数にchampion変数代入)
                        //このViewの定義は上記
                            ChampionCell(champion: champion)
                        }
                    }
                }
            }.padding(.top, -5)
        }
    }
}

struct ChampionRow_Previews: PreviewProvider {
    static var previews: some View {
        ChampionRow(champions: dataStore.champions, bios: dataStore.bios)
    }
}
