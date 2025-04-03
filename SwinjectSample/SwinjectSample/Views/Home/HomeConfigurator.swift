//
//  HomeConfigurator.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class HomeConfigurator {
    static func configure() -> HomeViewModel {
        return HomeViewModel(network: FactoryContainer.shared.resolve(Network.self))
    }
}
