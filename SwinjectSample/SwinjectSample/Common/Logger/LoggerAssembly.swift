//
//  LoggerAssembly.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class LoggerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Logger.self) { _ in ConsoleLogger() }
            .inObjectScope(.weak)
    }
}
