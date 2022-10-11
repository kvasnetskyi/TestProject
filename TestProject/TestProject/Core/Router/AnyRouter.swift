//
//  AnyRouter.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Foundation
import SwiftUI

final class AnyRouter {
    // MARK: - Private Properties
    private let router: any Router
    
    // MARK: - Init
    init(router: any Router) {
        self.router = router
    }
}

// MARK: - Internal Methods
extension AnyRouter {
    func getRoot(_ container: AppContainerProtocol) -> AnyView {
        router.getRoot(container)
    }
}

// MARK: - Hashable
extension AnyRouter: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    static func ==(lhs: AnyRouter, rhs: AnyRouter) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
