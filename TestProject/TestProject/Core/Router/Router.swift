//
//  Router.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Foundation
import SwiftUI

protocol Router: AnyObject {
    var navigationStore: NavigationStore? { get set }
    
    func getRoot(_ container: AppContainerProtocol) -> AnyView
}

// MARK: - Reusable Methods
extension Router {
    func popModule() {
        navigationStore?.path.removeLast()
    }
    
    func eraiseToAnyRouter() -> AnyRouter {
        AnyRouter(router: self)
    }
}
