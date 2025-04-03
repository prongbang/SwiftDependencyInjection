//
//  DataStore.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

enum DataStoreNamed: String {
    case userDefaults = "UserDefaults"
}

protocol DataStore {
    func get(key: String) -> String?
    func set(key: String, value: String)
    func remove(key: String)
}
