//
//  AppErrorProtocol.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

protocol AppErrorProtocol: Error {
    var title: String { get }
}
