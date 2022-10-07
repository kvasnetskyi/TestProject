//
//  ModuleFactoryProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Combine
import SwiftUI

protocol ModuleFactoryProtocol: AnyObject {
    associatedtype Destination: Hashable
    
    func build(_ destination: Destination) -> AnyView
}
