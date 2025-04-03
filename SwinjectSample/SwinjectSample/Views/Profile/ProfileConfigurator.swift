//
//  ProfileConfigurator.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation

class ProfileConfigurator {
    static func configure() -> ProfileViewModel {
        let logger = ConsoleLogger()
        let network = MobileNetwork(logger: logger)
        return ProfileViewModel(network: network)
    }
}
