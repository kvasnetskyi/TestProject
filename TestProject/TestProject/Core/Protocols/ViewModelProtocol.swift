//
//  ViewModelProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation
import Combine

struct AlertModel {
    var isAlertPresent: Bool = false
    var alertMessage: String?
}

protocol ViewModelProtocol: ObservableObject {
    var isLoaderPresent: Bool { get set }
    var alertModel: AlertModel { get set }
}
