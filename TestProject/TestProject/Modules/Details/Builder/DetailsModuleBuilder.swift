//
//  DetailsModuleBuilder.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 11.10.2022.
//

import Foundation

enum DetailsTransition: Transition {
    case backTapped
}

final class DetailsModuleBuilder {
    static func build(
        category: String,
        _ facts: [AnimalContent]
    ) -> Module<DetailsTransition, DetailsView<DetailsViewModel>> {
        let viewModel = DetailsViewModel(category: category, facts)
        
        return .init(
            view: DetailsView(viewModel: viewModel),
            transitionPublisher: viewModel.transitionPublisher
        )
    }
}
