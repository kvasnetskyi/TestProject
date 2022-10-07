//
//  AnimalsService.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

final class AnimalsService {
    // MARK: - Private Properties
    private let bundleService: JSONBundleServiceProtocol
    
    // MARK: - Init
    init(_ bundleService: JSONBundleServiceProtocol) {
        self.bundleService = bundleService
    }
}

// MARK: - AnimalsServiceProtocol
extension AnimalsService: AnimalsServiceProtocol {
    func getAnimals() -> AnyPublisher<[Animal], AppError> {
        bundleService.getModel(name: Constants.fileName)
    }
}

// MARK: - Static Properties
private struct Constants {
    static let fileName = "ios-challenge-words-booster"
}
