//
//  MainModuleFactory.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Combine
import SwiftUI

final class MainModuleFactory {
    // MARK: - Internal Properties
    weak var transitionHandler: TransitionHandler?
    
    // MARK: - Private Properties
    private let container: AppContainerProtocol
    
    // MARK: - Init
    init(
        _ container: AppContainerProtocol
    ) {
        self.container = container
    }
}

// MARK: - ModuleFactoryProtocol
extension MainModuleFactory: ModuleFactoryProtocol {
    func buildRoot(_ stackStorage: StackStorage<MainDestination>) -> AnyView {
        let viewModel = ListViewModel()
        transitionHandler?.observe(viewModel.transition)
        
        return ListView(
            moduleFactory: self,
            viewModel: viewModel,
            stackStorage: stackStorage
        )
        .eraiseToAnyView()
    }
    
    func build(_ destination: MainDestination) -> AnyView {
        switch destination {
        case .nextScreen(let text):
            return getNextScreen(text)
        }
    }
}

// MARK: - Private Methods
private extension MainModuleFactory {
    func getNextScreen(_ text: String) -> AnyView {
        Text(text)
            .eraiseToAnyView()
    }
}
