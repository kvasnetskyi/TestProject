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
        let model = ListModel(container.animalsService)
        let viewModel = ListViewModel(coordinator, model)
        
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
        case let .animalDetails(category, content, coordinator):
            return getAnimalDetails(category: category, content, coordinator)
        }
    }
}

// MARK: - Private Methods
private extension MainModuleFactory {
    func getAnimalDetails<Coordinator: DetailsCoordinator>(
        category: String,
        _ content: [AnimalContent],
        _ coordinator: Coordinator
    ) -> AnyView {
        let viewModel = DetailsViewModel(
            category: category,
            content,
            coordinator
        )
        
        return DetailsView(viewModel: viewModel)
            .eraiseToAnyView()
    }
}
