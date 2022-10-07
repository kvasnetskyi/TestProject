//
//  ListViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Combine

final class ListViewModel: BaseViewModel {
    // MARK: - Private Properties
    private weak var coordinator: ListCoordintor?
    
    // MARK: - Init
    init(_ coordinator: ListCoordintor) {
        self.coordinator = coordinator
    }
    
    func pushSmth() {
        coordinator?.openDetails()
    }
}
