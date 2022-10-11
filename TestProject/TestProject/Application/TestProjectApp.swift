//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI

@main
struct TestProjectApp: App {
    @StateObject private var navigationStore = NavigationStore()
    
    private let container: AppContainerProtocol = AppContainer()
    private let mainRouter = ListRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationStore.path) {
                getRoot()
                    .navigationDestination(for: AnyRouter.self) { router in
                        router.getRoot(container)
                    }
            }
        }
    }
}

// MARK: - Private Methods
private extension TestProjectApp {
    func getRoot() -> AnyView {
        mainRouter.navigationStore = navigationStore
        
        return mainRouter.getRoot(container)
    }
}
