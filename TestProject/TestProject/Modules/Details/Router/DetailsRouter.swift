//
//  DetailsRouter.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Combine
import SwiftUI

final class DetailsRouter: Router {
    // MARK: - Inernal Properties
    weak var navigationStore: NavigationStore?
    
    // MARK: - Private Properties
    private let category: String
    private let content: [AnimalContent]
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    init(
        category: String,
        _ content: [AnimalContent],
        _ navigationStore: NavigationStore
    ) {
        self.category = category
        self.content = content
        self.navigationStore = navigationStore
    }
}

// MARK: - Internal Methods
extension DetailsRouter {
    func getRoot(_ container: AppContainerProtocol) -> AnyView {
        let module = DetailsModuleBuilder.build(category: category, content)
        module.transitionPublisher
            .sink { [weak self] route in
                guard let self = self else { return }
                
                switch route {
                case .backTapped:
                    self.popModule()
                }
            }
            .store(in: &subscriptions)
        
        return module.view.eraiseToAnyView()
    }
}
