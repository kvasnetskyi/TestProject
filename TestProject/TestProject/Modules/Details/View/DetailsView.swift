//
//  DetailsView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import SwiftUI

struct DetailsView<ViewModel: DetailsViewModelProtocol>: View {
    // MARK: - Internal Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: Body
    var body: some View {
        VStack {
            NavigationBarView(title: viewModel.category) {
                viewModel.backTapped()
            }
            
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: .zero) {
                    ForEach($viewModel.facts) { fact in
                        AnimalDetail(content: fact.wrappedValue)
                            .frame(
                                width: UIScreen.main.bounds.width - Constants.cardPadding * 2,
                                height: Constants.cardHeight
                            )
                            .padding([.leading, .trailing], Constants.cardPadding)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        .background(Color.gray)
        .navigationBarHidden(true)
        .subscribeToRenderingStates($viewModel)
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
        .onDisappear {
            UIScrollView.appearance().isPagingEnabled = false
        }
    }
}

// MARK: - Static Properties
private struct Constants {
    static let cardHeight: CGFloat = 335
    static let cardPadding: CGFloat = 20
}
