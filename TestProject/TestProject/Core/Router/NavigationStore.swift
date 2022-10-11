//
//  NavigationStore.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Foundation
import SwiftUI

final class NavigationStore: ObservableObject {
    // MARK: - Internal Properties
    @Published var path = NavigationPath()
}
