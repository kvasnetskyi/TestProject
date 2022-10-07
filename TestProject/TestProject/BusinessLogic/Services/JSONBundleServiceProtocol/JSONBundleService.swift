//
//  JSONBundleService.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

final class JSONBundleService {
    // MARK: - Private Properties
    private let bundle: Bundle
    private let decoder: JSONDecoder
    
    // MARK: - Init
    init(_ bundle: Bundle, _ decoder: JSONDecoder) {
        self.bundle = bundle
        self.decoder = decoder
    }
}

// MARK: - BundleServiceProtocol
extension JSONBundleService: JSONBundleServiceProtocol {
    func getModel<T: Decodable>(name: String) -> AnyPublisher<T, AppError> {
        let fileURL = bundle.url(
            forResource: name,
            withExtension: Constants.extensionSufix
        )
        
        guard let fileURL else {
            return Fail(error: AppError.bundleFileNotFound)
                .eraseToAnyPublisher()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let model = try decoder.decode(T.self, from: data)
            
            return Just(model)
                .setFailureType(to: AppError.self)
                .eraseToAnyPublisher()
            
        } catch {
            return Fail(error: AppError.custom(error.localizedDescription))
                .eraseToAnyPublisher()
        }
    }
}

// MARK: - Static Properties
private struct Constants {
    static let extensionSufix = "json"
}
