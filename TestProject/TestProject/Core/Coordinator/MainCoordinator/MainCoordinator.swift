//
//  MainCoordinator.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Combine
import SwiftUI

final class MainCoordinator: Coordinator {
    // MARK: - Internal Properties
    var stackStorage = StackStorage<MainDestination>()
    var childCoordinators = [any Coordinator]()
    var parent: (any Coordinator)?
    var container: AppContainerProtocol!
    
    // MARK: - Private Properties
    lazy private var factory: MainModuleFactory = {
        let container = MainModuleFactory(container)
        
        return container
    }()
    
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: - Internal Methods
extension MainCoordinator {
    func start() -> AnyView {
        factory.buildRoot(stackStorage, self)
    }
    
    func finish() {
        popToRoot()
    }
}

// MARK: - ListCoordintor
extension MainCoordinator: ListCoordintor {
    func openDetails(category: String, _ content: [AnimalContent]) {
        stackStorage.stack.append(
            .animalDetails(category: category, content, self)
        )
    }
}

// MARK: - DetailsCoordinator
extension MainCoordinator: DetailsCoordinator {
    func popDetailsModule() {
        popModule()
    }
}

// MARK: - Equtable
extension MainCoordinator {
    static func ==(lhs: MainCoordinator, rhs: MainCoordinator) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
