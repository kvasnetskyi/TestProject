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
        container.transitionHandler = self
        
        return container
    }()
    
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: - Internal Methods
extension MainCoordinator {
    func start() -> AnyView {
        factory.buildRoot(stackStorage)
    }
    
    func finish() {
        popToRoot()
    }
}

// MARK: - TransitionHandler
extension MainCoordinator: TransitionHandler {
    func observe<T: Transition>(_ transition: AnyPublisher<T, Never>) {
        switch transition {
        case is AnyPublisher<ListTransition, Never>:
            observe(transition as! AnyPublisher<ListTransition, Never>)
            
        default:
            debugPrint("Transition not supported")
        }
    }
}

// MARK: - Private Methods
private extension MainCoordinator {
    func observe(_ transition: AnyPublisher<ListTransition, Never>) {
        transition
            .sink { [unowned self] transition in
                switch transition {
                case .testTransition(let text):
                    stackStorage.stack.append(.nextScreen(text: text))
                }
            }
            .store(in: &subscriptions)
    }
}
