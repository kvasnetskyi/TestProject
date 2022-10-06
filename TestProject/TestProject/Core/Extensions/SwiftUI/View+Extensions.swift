//
//  View+Extensions.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI
import Combine

extension View {
    func subscribeToRenderingStates<ViewModel: ViewModelProtocol>(
        _ viewModel: ObservedObject<ViewModel>.Wrapper
    ) -> some View {
        ZStack {
            self
            
            if viewModel.isLoaderPresent.wrappedValue {
                LoaderView()
            }
        }
        .alert(
            viewModel.alertModel.alertMessage.wrappedValue ?? String(),
            isPresented: viewModel.alertModel.isAlertPresent
        ) {
            Button(Localization.ok) {
                viewModel.alertModel.isAlertPresent.wrappedValue = false
                viewModel.alertModel.alertMessage.wrappedValue = nil
            }
        }
    }
    
    func eraiseToAnyView() -> AnyView {
        AnyView(self)
    }
}
