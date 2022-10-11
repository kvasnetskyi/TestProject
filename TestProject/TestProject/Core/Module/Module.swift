//
//  Module.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Combine
import SwiftUI

protocol Transition: Hashable {}

struct Module<T: Transition, V: View> {
    let view: V
    let transitionPublisher: AnyPublisher<T, Never>
}
