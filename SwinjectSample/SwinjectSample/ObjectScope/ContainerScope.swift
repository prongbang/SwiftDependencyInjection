//
//  ContainerScope.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class ContainerScope {
    func example() {
        let container = Container()
        
        container.register(UserDefaults.self) { _ in UserDefaults.standard }
            .inObjectScope(.container)
        
        container.register(DataStore.self) { r in
            UserDefaultsDataStore(userDefaults: r.resolve(UserDefaults.self))
        }.inObjectScope(.container)
        
        // Using
        let dataStore1 = container.resolve(DataStore.self) as? UserDefaultsDataStore
        let dataStore2 = container.resolve(DataStore.self) as? UserDefaultsDataStore
        
        // แชร์ instance เดียวกัน
        print(dataStore1 === dataStore2) // true
    }
}
