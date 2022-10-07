//
//  DetailsViewModelProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

protocol DetailsViewModelProtocol: ViewModelProtocol {
    var category: String { get }
    var facts: [AnimalContent] { get set }
    
    func backTapped()
}
