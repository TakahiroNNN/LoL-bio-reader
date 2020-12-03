//
//  ChampionData.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Champion : Hashable, Codable, Identifiable {
    public var id: Int
        // ID. No.
    public var name: String
        // チャンピオン名
    public var region: String
        // 地域
    fileprivate var imageName: String               // 画像リソース名
    public var image: Image { Image(imageName) }    // 画像
    fileprivate var iconName: String                // 画像リソース名
    public var icon: Image { Image(iconName) }      // 画像
}
