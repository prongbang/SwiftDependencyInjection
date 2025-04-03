//
//  CacheAssembly.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class CacheAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CacheManager.self) { _ in
            InMemoryCacheManager()
        }.inObjectScope(.container)
    }
}
