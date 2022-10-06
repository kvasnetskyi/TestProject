//
//  Container.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Swinject

protocol AppContainerProtocol: AnyObject {
    
}

final class AppContainer: AppContainerProtocol {
    // MARK: - Private Properties
    private let swinject = Container()
    
    init() {
        registerServices()
    }
}

// MARK: - Private Methods
private extension AppContainer {
    func registerServices() {
        
    }
    
    func resolve<T>() -> T {
        swinject.resolve(T.self)!
    }
}
