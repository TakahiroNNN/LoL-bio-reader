//
//  OtherView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/03.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: width * 0.8, height: height * 0.8)
                .cornerRadius(20)
                .foregroundColor(.white)
                .frame(height: 15)
            VStack{
                Text("Legal Jibber Jabber ポリシー")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                Text("───")
                    .foregroundColor(Color.black)
                Text("LoL Bio Reader  は、ライアットゲームズが公式承認するものではなく、ライアットゲームズ又はリーグ・オブ・レジェンドの製作・管理に正式に関与したいかなる者の見解・意見に基づくものではありません。リーグ・オブ・レジェンド及びライアットゲームズは、Riot Games, Inc.の商標又は登録商標です。リーグ・オブ・レジェンド © Riot Games, Inc.")
                    .foregroundColor(Color.black)
                    .frame(width: width * 0.7)
                Text("───────────────")
                    .foregroundColor(Color.gray)
                    .padding()
                
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
