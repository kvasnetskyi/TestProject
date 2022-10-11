//
//  DetailsViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

final class DetailsViewModel: BaseViewModel, DetailsViewModelProtocol {
    // MARK: - Internal Properties
    let category: String
    
    @Published var facts = [AnimalContent]()
    
    lazy var transitionPublisher = transition.eraseToAnyPublisher()
    
    // MARK: - Private Properties
    private let transition = PassthroughSubject<DetailsTransition, Never>()
    
    // MARK: - Init
    init(
        category: String,
        _ facts: [AnimalContent]
    ) {
        self.category = category
        self.facts = facts
    }
}

// MARK: - Internal Methods
extension DetailsViewModel {
    func backTapped() {
        transition.send(.backTapped)
    }
}
