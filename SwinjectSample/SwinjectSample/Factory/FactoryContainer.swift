//
//  FactoryContainer.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Swinject

public class FactoryContainer {
    public static let shared = FactoryContainer()
    
    private let container: Container
    
    private init() {
        container = Container()
    }

    @discardableResult
    public func register<T>(
        _ serviceType: T.Type,
        name: String? = nil,
        factory: @escaping (Resolver) -> T
    ) -> ServiceEntry<T> {
        return FactoryContainer.shared.container.register(serviceType, name: name, factory: factory)
    }
    
    public func resolve<T>(_ type: T.Type) -> T? {
        return FactoryContainer.shared.container.resolve(T.self)
    }
    
    public func resolve<T>(_ type: T.Type, name: String) -> T? {
        return FactoryContainer.shared.container.resolve(T.self, name: name)
    }
}
