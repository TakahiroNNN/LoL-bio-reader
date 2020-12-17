//
//  RegionCell.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/01.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

fileprivate let panel_gradient = Gradient(
    stops: [.init(color: Color(red:195.0/255,green:167.0/255,blue:88.0/255,opacity:1.0), location: 0.0),
            .init(color: Color(red:108.0/255,green:83.0/255,blue:31.0/255,opacity:1.0), location: 1)])
fileprivate let panelColor = LinearGradient(gradient: panel_gradient, startPoint: .top, endPoint: .bottom)
fileprivate let themeColor = Color(red: 147/255, green: 115/255, blue: 65/255)

struct BioCell: View{
    //変数定義
    var bio: Bio

    var body: some View{
        ZStack{
            Rectangle()
                .frame(height: height/6.5)
                .padding([.leading, .trailing], width/12)
                .padding(.bottom)
                .foregroundColor(Color(
                    red:23.0/255,
                    green:25.0/255,
                    blue:30.0/255,
                    opacity:1.0
                    ))
            Rectangle()
                .stroke(style: .init(lineWidth: 2))
                .fill(panelColor)
                .frame(height: height/6.5)
                .padding([.leading, .trailing], width/12)
                .padding(.bottom)
            Text(bio.title)
                .font(.title)
                .foregroundColor(themeColor)
                .frame(width: width*0.7, height: height*0.1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
                

        }
    }
}

struct BioCell_Previews: PreviewProvider {
    static var previews: some View {
        BioCell(bio: dataStore.bios[7])
    }
}
