//
//  AppContainer.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

public class AppContainer {
    static func registerDependencies() {
        FactoryContainer.shared.register(CacheManager.self) { _ in
            InMemoryCacheManager()
        }.inObjectScope(.container)
        
        FactoryContainer.shared.register(DataStore.self) { _ in
            UserDefaultsDataStore(userDefaults: UserDefaults.standard)
        }.inObjectScope(.weak)
        
        FactoryContainer.shared.register(Logger.self) { _ in
            ConsoleLogger()
        }.inObjectScope(.weak)
        
        FactoryContainer.shared.register(Network.self) { r in
            MobileNetwork(logger: r.resolve(Logger.self))
        }.inObjectScope(.weak)
    }
}
