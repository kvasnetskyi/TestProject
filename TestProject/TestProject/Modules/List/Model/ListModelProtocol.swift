//
//  ListModelProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

protocol ListModelProtocol {
    func getAnimals() -> AnyPublisher<[Animal], AppError>
}
