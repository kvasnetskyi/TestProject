//
//  Coordinator.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI
import Combine

protocol Coordinator: AnyObject {
    associatedtype Destination: Hashable
    
    var stackStorage: StackStorage<Destination> { get set }
    var childCoordinators: [any Coordinator] { get set }
    var parent: (any Coordinator)? { get }
    
    func start() -> AnyView
    func finish()
}

// MARK: - Reusable Methods
extension Coordinator {
    func popModule() {
        stackStorage.stack.removeLast()
    }
    
    func popToRoot() {
        stackStorage.stack.removeAll()
    }
    
    func removeSelfFromParent() {
        let index = parent?.childCoordinators.lastIndex {
            $0 === self
        }
        
        guard let index, let parent else { return }
        
        parent.childCoordinators.remove(at: index)
    }
}
