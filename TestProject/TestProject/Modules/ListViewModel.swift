//
//  ListViewModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Combine

final class ListViewModel: BaseViewModel {
    lazy var transition = transitionSubject.eraseToAnyPublisher()
    
    private let transitionSubject = PassthroughSubject<ListTransition, Never>()
    
    func pushSmth() {
        transitionSubject.send(
            .testTransition(text: "Test Transition")
        )
    }
}
