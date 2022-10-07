//
//  AppConfigurationProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation

protocol AppConfigurationProtocol {
    var bundle: Bundle { get }
    var environment: AppEnvironment { get }
}
