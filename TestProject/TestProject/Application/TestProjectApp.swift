//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI

@main
struct TestProjectApp: App {
    private let container: AppContainerProtocol = AppContainer()
    private let coordinator = MainCoordinator()
    
    var body: some Scene {
        WindowGroup {
            getRoot()
        }
    }
}

// MARK: - Private Methods
private extension TestProjectApp {
    func getRoot() -> AnyView {
        self.coordinator.container = container
        
        return coordinator.start()
    }
}
