//
//  ListView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI
import Combine

struct ListView<Factory: ModuleFactoryProtocol>: View where Factory.Destination == MainDestination {
    let moduleFactory: Factory
    
    @StateObject var viewModel: ListViewModel
    @StateObject var stackStorage: StackStorage<MainDestination>
    
    var body: some View {
        NavigationStack(path: $stackStorage.stack) {
            Button("Tap") {
                viewModel.pushSmth()
            }
            .subscribeToRenderingStates($viewModel)
            .navigationDestination(
                for: MainDestination.self
            ) { destination in
                moduleFactory.build(destination)
            }
        }
    }
}
