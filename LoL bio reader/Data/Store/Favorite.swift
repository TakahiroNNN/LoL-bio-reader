//
//  Region.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/10/24.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Favorite : Hashable, Codable, Identifiable {
    public var id: Int
    public var favorite: Bool
}
