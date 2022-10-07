//
//  ImageLoaderServiceProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation
import Combine

protocol ImageLoaderServiceProtocol {
    func loadImageData(_ url: URL) -> AnyPublisher<Data, AppError>
}
