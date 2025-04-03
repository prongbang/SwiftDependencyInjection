//
//  CustomScope.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Foundation
import Swinject

extension ObjectScope {
    // PermanentStorage is .container scope
    static let session = ObjectScope(storageFactory: PermanentStorage.init)
}

class UserSession {
    var username: String = "Guest"
}

class CustomScope {
    func example() {
        let container = Container()
                
        container.register(UserSession.self) { _ in UserSession() }
            .inObjectScope(.session)

        // Using
        let user1 = container.resolve(UserSession.self)
        user1?.username = "Alice"

        let user2 = container.resolve(UserSession.self)
        // แชร์ instance เดียวกัน
        print(user2?.username) // "Alice"

        // รีเซ็ต session
        container.resetObjectScope(.session)

        let user3 = container.resolve(UserSession.self)
        // ถูกสร้างใหม่
        print(user3?.username) // "Guest"
    }
}
