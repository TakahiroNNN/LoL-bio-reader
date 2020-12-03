//
//  BioStory.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/11.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct BioStory: View {
//    @State var i = 0
    var image: Image
    var bio: Bio
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .scaledToFill()
                .frame(width: width)
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.8)
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center){
                    Text("\(bio.title)")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing])
                    Text("──────────")
                    Text(bio.content)
                        .font(.headline)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 30)
                    }
                }
        }
//        .navigationBarTitle(Text("\(bio.title)"), displayMode: .inline)
        .navigationBarTitle(bio.title)
    }
}




//struct BioStory_Previews: PreviewProvider {
//    static var previews: some View {
//        Group{
//            ForEach(dataStore.bios, id:\.self){bio in BioStory(bio: bio)}
//        }
////        .previewLayout(.fixed(width: 300, height: 300))
//    }
//}
