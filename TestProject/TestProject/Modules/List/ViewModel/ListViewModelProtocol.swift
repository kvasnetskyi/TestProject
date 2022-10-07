//
//  ListViewModelProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

protocol ListViewModelProtocol: ViewModelProtocol {
    var animals: [Animal] { get set }
    
    func onAppear()
}
