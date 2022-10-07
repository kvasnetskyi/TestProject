//
//  AnimalDetail.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import SwiftUI

struct AnimalDetail: View {
    // MARK: - Internal Properties
    let content: AnimalContent
    
    // MARK: Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.white)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                
                VStack {
                    LoadableImage(url: content.image)
                        .clipShape(Circle())
                        .frame(
                            width: Constants.imageSize,
                            height: Constants.imageSize
                        )
                        .padding()
                    
                    Text(content.fact)
                        .multilineTextAlignment(.center)
                        .font(Constants.font)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing, .bottom])
                    
                    Spacer()
                }
            }
        }
        .cornerRadius(Constants.cornerRadius)
    }
}

// MARK: - Static Properties
private struct Constants {
    static let font: Font = .system(size: 18)
    static let imageSize: CGFloat = 150
    static let cornerRadius: CGFloat = 6
}
