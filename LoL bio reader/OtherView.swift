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
                Text("Developer")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                    .padding(.bottom, height/1000)
                Text("TOMsJELLY\nT. Nakagawa")
                    .foregroundColor(Color.black)
                    .font(.subheadline)
                Text("──────────")
                    .foregroundColor(Color.gray)
                Text("Legal Jibber Jabber ポリシー")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.bottom, height/1000)
//                Text("───")
//                    .foregroundColor(Color.gray)
                Text("LoL Champions' Lore  は、ライアットゲームズが公式承認するものではなく、ライアットゲームズ又はリーグ・オブ・レジェンドの製作・管理に正式に関与したいかなる者の見解・意見に基づくものではありません。リーグ・オブ・レジェンド及びライアットゲームズは、Riot Games, Inc.の商標又は登録商標です。リーグ・オブ・レジェンド © Riot Games, Inc.")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    .frame(width: width * 0.7)

                
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
