//
//  MainModuleFactory.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Combine
import SwiftUI

final class MainModuleFactory {
    // MARK: - Private Properties
    private let container: AppContainerProtocol
    
    // MARK: - Init
    init(_ container: AppContainerProtocol) {
        self.container = container
    }
}

// MARK: - Internal Properties
extension MainModuleFactory {
    func buildRoot(
        _ stackStorage: StackStorage<MainDestination>,
        _ coordinator: ListCoordintor
    ) -> AnyView {
        let viewModel = ListViewModel(coordinator)
        
        return ListView(
            moduleFactory: self,
            viewModel: viewModel,
            stackStorage: stackStorage
        )
        .eraiseToAnyView()
    }
}

// MARK: - ModuleFactoryProtocol
extension MainModuleFactory: ModuleFactoryProtocol {
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
