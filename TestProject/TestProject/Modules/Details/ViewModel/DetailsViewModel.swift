//
//  DetailsViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

final class DetailsViewModel<Coordinator: DetailsCoordinator>: BaseViewModel, DetailsViewModelProtocol {
    // MARK: - Internal Properties
    let category: String
    
    @Published var facts = [AnimalContent]()
    
    // MARK: - Private Properties
    private weak var coordinator: Coordinator?
    
    // MARK: - Init
    init(
        category: String,
        _ facts: [AnimalContent],
        _ coordinator: Coordinator
    ) {
        self.category = category
        self.coordinator = coordinator
        self.facts = facts
    }
}

// MARK: - Internal Methods
extension DetailsViewModel {
    func backTapped() {
        coordinator?.popDetailsModule()
    }
}
