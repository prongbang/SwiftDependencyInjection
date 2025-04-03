//
//  SettingConfigurator.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class SettingConfigurator {
    static func configure() -> SettingViewModel {
        return SettingViewModel(
            network: FactoryContainer.shared.resolve(Network.self),
            cacheManager: FactoryContainer.shared.resolve(CacheManager.self)
        )
    }
}
