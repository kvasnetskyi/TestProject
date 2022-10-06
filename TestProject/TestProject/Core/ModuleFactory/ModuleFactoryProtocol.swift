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
    
    func buildRoot(_ stackStorage: StackStorage<Destination>) -> AnyView
    func build(_ destination: Destination) -> AnyView
}

protocol TransitionHandler: AnyObject {
    func observe<T: Transition>(_ transition: AnyPublisher<T, Never>)
}
