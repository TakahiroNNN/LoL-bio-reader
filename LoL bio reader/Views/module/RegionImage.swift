//
//  RegionImage.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI

fileprivate let gradient = Gradient(colors: [.white,
    Color.init(red: 0.9, green: 0.9, blue: 0.9)])

fileprivate let linear = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)

struct RegionImage: View {
    let icon: Image
    let image: Image
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .cornerRadius(10)
                .frame(width: 350, height: 200)
            Color.black.opacity(0.4)
                .cornerRadius(10)
                .frame(width: 350, height: 200)
            icon
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .frame(width: 100, height: 100)
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
        .previewLayout(.fixed(width: 450, height: 300))
    }
}
