//
//  UserDefaultsDataStore.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

public class UserDefaultsDataStore: DataStore {
    private let userDefaults: UserDefaults?
    
    init(userDefaults: UserDefaults?) {
        self.userDefaults = userDefaults
    }
    
    public func get(key: String) -> String? {
        return userDefaults?.string(forKey: key)
    }
    
    public func set(key: String, value: String) {
        userDefaults?.set(value, forKey: key)
    }
    
    public func remove(key: String) {
        userDefaults?.removeObject(forKey: key)
    }
}
