//
//  ListViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Combine

final class ListViewModel: BaseViewModel, ListViewModelProtocol {
    // MARK: - Internal Properties
    @Published var animals = [Animal]()
    
    lazy var transitionPublisher = transition.eraseToAnyPublisher()
    
    // MARK: - Private Properties
    private let model: ListModelProtocol
    private let transition = PassthroughSubject<ListTransition, Never>()
    
    // MARK: - Init
    init(_ model: ListModelProtocol) {
        self.model = model
    }
}

// MARK: - Internal Methods
extension ListViewModel {
    func onAppear() {
        renderingState.value = .loading
        
        model.getAnimals()
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                guard case let .failure(error) = completion else {
                    return
                }

                self.renderingState.value = .alert(message: error.description)

            } receiveValue: { [unowned self] animals in
                self.animals = animals
                self.renderingState.value = .view
            }
            .store(in: &subscriptions)
    }
    
    func rowTapped(_ animal: Animal) {
        guard let content = animal.content else { return }
        
        transition.send(
            .openDetails(category: animal.title, content)
        )
    }
}
