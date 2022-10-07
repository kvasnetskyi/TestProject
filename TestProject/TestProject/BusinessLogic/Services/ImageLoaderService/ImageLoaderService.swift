//
//  ImageLoaderService.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

final class ImageLoaderService: ImageLoaderServiceProtocol {
    func loadImageData(_ url: URL) -> AnyPublisher<Data, AppError> {
        Deferred {
            Future { promise in
                do {
                    let data = try Data(contentsOf: url)
                    promise(.success(data))
                    
                } catch {
                    promise(.failure(.custom(error.localizedDescription)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
