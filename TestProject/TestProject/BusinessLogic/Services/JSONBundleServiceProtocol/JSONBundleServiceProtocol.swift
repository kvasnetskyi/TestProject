//
//  JSONBundleServiceProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

protocol JSONBundleServiceProtocol {
    func getModel<T: Decodable>(name: String) -> AnyPublisher<T, AppError>
}
