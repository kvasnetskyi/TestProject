//
//  ListModel.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

final class ListModel {
    // MARK: - Private Properties
    private let animalService: AnimalsServiceProtocol
    
    // MARK: - Init
    init(_ animalService: AnimalsServiceProtocol) {
        self.animalService = animalService
    }
}

extension ListModel: ListModelProtocol {
    func getAnimals() -> AnyPublisher<[Animal], AppError> {
        animalService.getAnimals()
    }
}
