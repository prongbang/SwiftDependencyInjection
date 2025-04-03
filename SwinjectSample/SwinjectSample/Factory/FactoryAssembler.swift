//
//  FactoryAssempler.swift
//  SwinjectSample
//
//  Created by prongbang on 3/4/2568 BE.
//

import Swinject

public class FactoryAssembler {
    public static let shared = FactoryAssembler()

    private let container: Container
    private let assembler: Assembler

    private init() {
        container = Container()
        assembler = Assembler([], container: container)
    }

    public func resolve<T>(_ type: T.Type) -> T? {
        return FactoryAssembler.shared.assembler.resolver.resolve(T.self)
    }

    public func resolve<T>(_ type: T.Type, name: String) -> T? {
        return FactoryAssembler.shared.assembler.resolver.resolve(T.self, name: name)
    }

    public func resolve<T, Arg1>(_ type: T.Type, argument: Arg1) -> T? {
        return FactoryAssembler.shared.assembler.resolver.resolve(T.self, argument: argument)
    }

    public func resolve<T, Arg1>(_ type: T.Type, name: String, argument: Arg1) -> T? {
        return FactoryAssembler.shared.assembler.resolver.resolve(T.self, name: name, argument: argument)
    }

    public func apply(assemblies: [Assembly]) {
        FactoryAssembler.shared.assembler.apply(assemblies: assemblies)
    }
    
    public func reset(scopes: [ObjectScope] = [.transient, .graph, .container, .weak]) {
        scopes.forEach { FactoryAssembler.shared.container.resetObjectScope($0) }
    }
}
