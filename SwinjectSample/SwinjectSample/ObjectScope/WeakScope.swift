//
//  WeakScope.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class WeakScope {
    func example() {
        let container = Container()
                
        container.register(CacheManager.self) { _ in InMemoryCacheManager() }
            .inObjectScope(.weak)

        // Using
        var cache1 = container.resolve(CacheManager.self) as? InMemoryCacheManager
        var cache2 = container.resolve(CacheManager.self) as? InMemoryCacheManager

        // Set value
        cache1?.set(key: "key1", "value1")
        
        // แชร์ instance เดียวกัน
        print(cache1 === cache2) // true
        print((cache1?.get(key: "key1") as? String) == (cache2?.get(key: "key1") as? String)) // true

        // ปล่อย reference
        cache1 = nil
        cache2 = nil
        
        // cache3 ถูกสร้างใหม่ เพราะถูกปล่อย reference
        let cache3 = container.resolve(CacheManager.self) as? InMemoryCacheManager
        print((cache3?.get(key: "key1") as? String) == "value1") // false
    }
}
