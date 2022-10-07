//
//  ListView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI
import Combine

struct ListView<Destination: Hashable, Factory: ModuleFactoryProtocol>: View where Factory.Destination == Destination {
    let moduleFactory: Factory
    
    @StateObject var viewModel: ListViewModel
    @StateObject var stackStorage: StackStorage<Destination>
    
    var body: some View {
        NavigationStack(path: $stackStorage.stack) {
            Button("Tap") {
                viewModel.pushSmth()
            }
            .subscribeToRenderingStates($viewModel)
            .navigationDestination(
                for: Destination.self
            ) { destination in
                moduleFactory.build(destination)
            }
        }
    }
}
