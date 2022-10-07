//
//  AppError.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

enum AppError: Error {
    case bundleFileNotFound
    case decoding
    case custom(_ description: String)
    
    var description: String {
        switch self {
        case .bundleFileNotFound:
            return Localization.Error.Bundle.fileNotFound
            
        case .decoding:
            return Localization.Error.decoding
            
        case .custom(let description):
            return description
        }
    }
}
