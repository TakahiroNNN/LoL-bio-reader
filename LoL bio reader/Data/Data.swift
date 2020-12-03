//
//  Data.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/09/04.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import Foundation

struct DataStore {
    let champions:[Champion] = load("champion.json")
    let regions:[Region] = load("region.json")
    let bios:[Bio] = load("bio.json")
    var favorite:[Favorite] = load("favorite.json")
}

let dataStore = DataStore()

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

