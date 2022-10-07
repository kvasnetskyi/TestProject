//
//  ListView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI
import Combine

struct ListView<ViewModel: ListViewModelProtocol, Factory: ModuleFactoryProtocol, Destination: Hashable>: View where Factory.Destination == Destination {
    // MARK: - Internal Properties
    let moduleFactory: Factory
    
    @StateObject var viewModel: ViewModel
    @StateObject var stackStorage: StackStorage<Destination>
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $stackStorage.stack) {
            VStack {
                List($viewModel.animals) { animal in
                    AnimalRow(animal: animal.wrappedValue)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(
                            .init(
                                top: Constants.rowTopBottomInsets,
                                leading: Constants.rowSidesInsets,
                                bottom: Constants.rowTopBottomInsets,
                                trailing: Constants.rowSidesInsets
                            )
                        )
                        .frame(height: Constants.rowHeight)
                        .onTapGesture {
                            viewModel.rowTapped(animal.wrappedValue)
                        }
                }
                .scrollContentBackground(.hidden)
                .edgesIgnoringSafeArea([.leading, .trailing])
                .listStyle(GroupedListStyle())
                
                Spacer()
            }
            .background(Color.gray)
            .subscribeToRenderingStates($viewModel)
            .navigationDestination(
                for: Destination.self
            ) { destination in
                moduleFactory.build(destination)
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

// MARK: - Static Properties
private struct Constants {
    static let rowHeight: CGFloat = 100
    static let rowTopBottomInsets: CGFloat = 16
    static let rowSidesInsets: CGFloat = 20
}
