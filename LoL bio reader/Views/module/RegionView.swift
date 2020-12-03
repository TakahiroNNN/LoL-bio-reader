//
//  ChampionView.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

//fileprivate let gradient = Gradient(colors: [.black, Color.init(red: 0.9, green: 0.9, blue: 0.9)])
fileprivate let gradient = Gradient(stops: [.init(color: .black, location: 0.0), .init(color: .clear, location: 0.5)])
fileprivate let linear = LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)

let height = UIScreen.main.bounds.size.height

struct RegionView: View {
    var region: Region
    
    var body: some View {
        ZStack(alignment: .leading){
            region.image
                .resizable()
//                .frame(height: 200)
                .frame(height: height/3.5)
                .scaledToFit()
                .overlay(Rectangle().fill(linear).opacity(1))
            VStack{
                region.icon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                Text(region.name)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.regions){region in RegionView(region: region)}
        }
//        .previewLayout(.fixed(width: 300, height: 300))
    }
}
