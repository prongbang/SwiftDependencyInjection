//
//  DataStoreAssembly.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class DataStoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DataStore.self) { _ in
            UserDefaultsDataStore(userDefaults: UserDefaults.standard)
        }.inObjectScope(.weak)
    }
}
