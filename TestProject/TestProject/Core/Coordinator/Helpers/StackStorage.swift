//
//  StackStorage.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation

final class StackStorage<Destination: Hashable>: ObservableObject {
    @Published var stack = [Destination]()
}
