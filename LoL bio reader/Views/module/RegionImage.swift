//
//  RegionImage.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

struct RegionImage: View {
    let icon: Image
    let image: Image
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .frame(width: width * 0.9, height: height * 0.3)
            Color.black.opacity(0.4)
                .frame(width: width * 0.9, height: height * 0.3)
                .overlay(
                    RegionFrame()
                        .stroke(style: .init(lineWidth: 0.5))
                        .fill(Color.yellow)
                )
            icon
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .frame(width: height * 0.15, height: height * 0.15)
        }
    }
}

struct RegionImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(dataStore.regions){
                region in RegionImage(icon: region.icon, image: region.image)
            }
        }
    }
}
