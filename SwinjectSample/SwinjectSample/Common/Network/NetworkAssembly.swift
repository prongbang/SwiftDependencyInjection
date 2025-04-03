//
//  NetworkAssembly.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Network.self) { r in
            MobileNetwork(logger: r.resolve(Logger.self))
        }.inObjectScope(.weak)
    }
}
