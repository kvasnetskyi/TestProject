//
//  ListModuleBuilder.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Combine
import SwiftUI

enum ListTransition: Transition {
    case openDetails(
        category: String,
        _ content: [AnimalContent]
    )
}

final class ListModuleBuilder {
    static func build(
        _ container: AppContainerProtocol
    ) -> Module<ListTransition, ListView<ListViewModel>> {
        let model = ListModel(container.animalsService)
        let viewModel = ListViewModel(model)
        
        return .init(
            view: ListView(viewModel: viewModel),
            transitionPublisher: viewModel.transitionPublisher
        )
    }
}
