//
//  MainCoordinatorProtocols.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import Foundation

protocol ListCoordintor: AnyObject {
    func openDetails(category: String, _ content: [AnimalContent])
}

protocol DetailsCoordinator: AnyObject, Hashable {
    func popDetailsModule()
}
