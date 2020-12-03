//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct BioRow: View {
    //保存したデータから複数使用するので、関数内で複数の変数を定義
    var image: Image
    var bios: [Bio]
    
    var body: some View {
        //vertical方向に並べて配置
        VStack(alignment: .leading) {
            //テキスト（サブタイトル）
            Text("物語")
                .font(.title)
                .padding(.leading, 30)
                .padding(.top, 5)
            //horizontal方向に並べて配置
            VStack(alignment: .leading, spacing: 0) {
                //自構造体の複数変数championsをひとつずつ使用して繰り返し
                ForEach(bios, id:\.self) {
                    bio in NavigationLink(destination: BioStory(image: image, bio: bio)){
                        BioCell(bio: bio)
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

//struct BioRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BioRow(bios: dataStore.bios)
//    }
//}
