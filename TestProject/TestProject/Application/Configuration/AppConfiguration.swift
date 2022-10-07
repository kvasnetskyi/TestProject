//
//  AppConfiguration.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation

final class AppConfiguration: AppConfigurationProtocol {
    let bundle: Bundle
    let environment: AppEnvironment
    
    init(bundle: Bundle) {
        guard let infoDict = bundle.infoDictionary,
              let environmentValue = infoDict[Key.environment] as? String,
              let environment = AppEnvironment(rawValue: environmentValue) else {
            fatalError("Config file error")
        }
        
        self.bundle = bundle
        self.environment = environment
    }
}

// MARK: - Static Properties
private enum Key {
    static let environment: String = "APP_ENVIRONMENT"
}
