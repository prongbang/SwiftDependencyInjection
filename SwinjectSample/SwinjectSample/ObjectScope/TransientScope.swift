//
//  TransientScope.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class TransientScope {
    func example() {
        let container = Container()
                
        container.register(CacheManager.self) { _ in InMemoryCacheManager() }
            .inObjectScope(.transient)
        
        let cache1 = container.resolve(CacheManager.self) as? InMemoryCacheManager
        let cache2 = container.resolve(CacheManager.self) as? InMemoryCacheManager
        
        // ถูกสร้างใหม่ทุกครั้ง
        print(cache1 === cache2) // false
    }
}
