//
//  InMemoryCacheManager.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class InMemoryCacheManager: CacheManager {
    private var cache: [String: Any] = [:]
    private let queue = DispatchQueue(label: "com.cacheManagerQueue", attributes: .concurrent)
    
    func set(key: String, _ value: Any) {
        queue.async(flags: .barrier) {
            self.cache[key] = value
        }
    }
    
    func get(key: String) -> Any? {
        var result: Any?
        queue.sync {
            result = self.cache[key]
        }
        return result
    }
}
