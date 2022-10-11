//
//  ListRouter.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Combine
import SwiftUI

final class ListRouter: Router {
    // MARK: - Internal Properties
    weak var navigationStore: NavigationStore?
    
    // MARK: - Private Properties
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: - Router
extension ListRouter {
    func getRoot(_ container: AppContainerProtocol) -> AnyView {
        let module = ListModuleBuilder.build(container)
        module.transitionPublisher
            .sink { [weak self] route in
                guard let self = self else { return }
                
                switch route {
                case let .openDetails(category, content):
                    guard let navigationStore = self.navigationStore else { return }
                    
                    let router = DetailsRouter(
                        category: category,
                        content,
                        navigationStore
                    ).eraiseToAnyRouter()
                    
                    navigationStore.path.append(router)
                }
            }
            .store(in: &subscriptions)
        
        return module.view.eraiseToAnyView()
    }
}
