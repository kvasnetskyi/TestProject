//
//  MainDestination.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation

enum MainDestination: Hashable {
    case animalDetails(
        category: String,
        _ content: [AnimalContent],
        _ coordinator: MainCoordinator
    )
}
