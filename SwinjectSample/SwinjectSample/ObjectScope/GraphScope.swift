//
//  GraphScope.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

class GraphScope {
    func example() {
        let container = Container()
        
        container.register(Logger.self, name: LoggerNamed.console.rawValue) { _ in ConsoleLogger() }
            .inObjectScope(.graph)
        
        container.register(Network.self) { r in
            let logger1 = r.resolve(Logger.self, name: LoggerNamed.console.rawValue) as? ConsoleLogger
            let logger2 = r.resolve(Logger.self, name: LoggerNamed.console.rawValue) as? ConsoleLogger
            
            // ใช้ instance เดียวกันภายใน graph scope
            print(logger1 === logger2) // true
            
            return MobileNetwork(logger: logger1)
        }
        .inObjectScope(.graph)
        
        // Using
        let network1 = container.resolve(Network.self) as? MobileNetwork
        let network2 = container.resolve(Network.self) as? MobileNetwork
        let logger1 = container.resolve(Logger.self, name: LoggerNamed.console.rawValue) as? ConsoleLogger
        let logger2 = container.resolve(Logger.self, name: LoggerNamed.console.rawValue) as? ConsoleLogger
        
        // ถูกสร้างใหม่ เพราะเรียกนอก graph scope
        print(network1 === network2)    // false
        print(logger1 === logger2)      // false
    }
}
