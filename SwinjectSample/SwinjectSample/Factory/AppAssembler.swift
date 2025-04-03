//
//  AppAssembler.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

public class AppAssembler {
    static func registerDependencies() {
        FactoryAssembler.shared.apply(assemblies: [
            LoggerAssembly(),
            CacheAssembly(),
            DataStoreAssembly(),
            NetworkAssembly()
        ])
    }
}
