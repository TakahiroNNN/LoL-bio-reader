//
//  Region.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Region : Hashable, Codable, Identifiable {
    public var id: UInt8
        // ID. No.
    public var name: String
        // 地域名
    fileprivate var iconName: String                // 画像リソース名
    public var icon: Image { Image(iconName) }      // 画像
    fileprivate var imageName: String               // 画像リソース名
    public var image: Image { Image(imageName) }    // 画像
    
    public var content: String
}
