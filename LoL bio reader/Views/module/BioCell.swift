//
//  RegionCell.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/01.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct BioCell: View{
    //変数定義
    var bio: Bio

    var body: some View{
        ZStack{
            Rectangle()
                .frame(height: 100)
                .padding([.leading, .trailing], 30)
                .padding(.bottom)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(bio.title)
                .font(.title)
                .padding(.bottom)
                .foregroundColor(.white)
        }
    }
}

struct BioCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.bios, id: \.self){
                bio in BioCell(bio: bio)
            }
        }
    }
}
