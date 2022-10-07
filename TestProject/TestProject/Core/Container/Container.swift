//
//  Container.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Swinject

protocol AppContainerProtocol: AnyObject {
    var appConfiguration: AppConfigurationProtocol { get }
    var jsonBundleService: JSONBundleServiceProtocol { get }
    var animalsService: AnimalsServiceProtocol { get }
}

final class AppContainer: AppContainerProtocol {
    // MARK: - Internal Properties
    var appConfiguration: AppConfigurationProtocol { resolve() }
    var jsonBundleService: JSONBundleServiceProtocol { resolve() }
    var animalsService: AnimalsServiceProtocol { resolve() }
    
    // MARK: - Private Properties
    private let swinject = Container()
    
    // MARK: - Init
    init() {
        registerServices()
    }
}

// MARK: - Private Methods
private extension AppContainer {
    func registerServices() {
        registerAppConfiguration()
        registerJSONBundleService()
        registerAnimalsService()
    }
    
    func resolve<T>() -> T {
        swinject.resolve(T.self)!
    }
    
    func registerAppConfiguration() {
        swinject.register(AppConfigurationProtocol.self) { _ in
            AppConfiguration(bundle: .main)
        }
        .inObjectScope(.container)
    }
    
    func registerJSONBundleService() {
        swinject.register(JSONBundleServiceProtocol.self) { resolver in
            let configuration = resolver.resolve(AppConfigurationProtocol.self)!
            
            return JSONBundleService(
                configuration.bundle,
                .init()
            )
        }
    }
    
    func registerAnimalsService() {
        swinject.register(AnimalsServiceProtocol.self) { resolver in
            AnimalsService(
                resolver.resolve(JSONBundleServiceProtocol.self)!
            )
        }
    }
}
