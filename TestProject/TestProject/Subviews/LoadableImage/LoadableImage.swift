//
//  LoadableImage.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import SwiftUI

struct LoadableImage: View {
    // MARK: - Internal Properties
    let url: URL
    
    // MARK: Body
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Color(.systemGray)
                    .overlay {
                        ProgressView()
                    }
                
            case .success(let image):
                image
                    .resizable()
                
            default:
                Assets.imageFailure.swiftUIImage
                    .resizable()
            }
        }
    }
}
