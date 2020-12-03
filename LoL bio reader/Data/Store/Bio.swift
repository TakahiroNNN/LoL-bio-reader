//
//  Region.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Bio : Hashable, Codable {
    public var champion: String            //関連チャンピオン
    public var title: String            //タイトル
    public var content: String          //バイオ内容
}
