//
//  ContentView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/03.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI



struct FirstViewHome: View {
    @State var showingModal = true
    
    var body: some View {
        VStack{
            if showingModal{
                ZStack{
                    HomeView()
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .opacity(0.85)
                            VStack{
                                Text("Legal Jibber Jabber \nポリシー")
                    //                .font(.system(size: 30))
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
//                                    .padding()
                                Text("──────────")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                    .padding()
                                Text("LoL Champions' Lore  は、ライアットゲームズが公式承認するものではなく、ライアットゲームズ又はリーグ・オブ・レジェンドの製作・管理に正式に関与したいかなる者の見解・意見に基づくものではありません。リーグ・オブ・レジェンド及びライアットゲームズは、Riot Games, Inc.の商標又は登録商標です。リーグ・オブ・レジェンド © Riot Games, Inc.")
                                    .font(.headline)
                                    .padding(.horizontal)
//                                    .padding()
                                Button(action: {self.showingModal.toggle()}) {
                                    Text("理解しました")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                }.padding()
                            }
                        }
                    }
                }
//                Spacer()
            }else{
                HomeView()
//                Spacer()
            }
        }
    }
}

struct FirstViewSearch: View {
    @State var showingModal = true
    
    var body: some View {
        VStack{
            if showingModal{
                ZStack{
                    SearchView()
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: width, height: height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .opacity(0.85)
                            VStack{
                                Text("Legal Jibber Jabber \nポリシー")
                    //                .font(.system(size: 30))
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
//                                    .padding()
                                Text("──────────")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                                    .padding()
                                Text("LoL Champions' Lore  は、ライアットゲームズが公式承認するものではなく、ライアットゲームズ又はリーグ・オブ・レジェンドの製作・管理に正式に関与したいかなる者の見解・意見に基づくものではありません。リーグ・オブ・レジェンド及びライアットゲームズは、Riot Games, Inc.の商標又は登録商標です。リーグ・オブ・レジェンド © Riot Games, Inc.")
                                    .font(.headline)
                                    .padding(.horizontal)
//                                    .padding()
                                Button(action: {self.showingModal.toggle()}) {
                                    Text("理解しました")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                }.padding()
                            }
                        }
                    }
                }
                Spacer()
            }else{
                SearchView()
                Spacer()
            }
        }
    }
}

struct ContentView : View {
    
    var body: some View {
        TabView{
            FirstViewHome()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("HOME")
                }.tag(1)
            FirstViewSearch()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("SEARCH")
                }.tag(2)
            OtherView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("OTHER")
                }.tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
