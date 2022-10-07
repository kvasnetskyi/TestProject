//
//  AnimalRow.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import SwiftUI
import Combine

struct AnimalRow: View {
    // MARK: - Internal Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        HStack {
            getAsyncImage()
            getContentView()
            Spacer()
        }
        .background {
            Color(.white)
        }
        .overlay {
            if animal.content == nil {
                getOverlay()
            }
        }
        .cornerRadius(Constants.cornerRadius)
    }
}

// MARK: - Private Methods
private extension AnimalRow {
    func getAsyncImage() -> some View {
        LoadableImage(url: animal.image)
            .scaledToFill()
            .clipShape(Circle())
            .frame(
                width: Constants.imageSize,
                height: Constants.imageSize
            )
            .padding([.leading, .top, .bottom])
    }
    
    func getContentView() -> some View {
        VStack(alignment: .leading) {
            Text(animal.title)
                .foregroundColor(.black)
                .font(Constants.titleFont)
            
            Text(animal.description)
                .foregroundColor(.black)
                .font(Constants.descriptionFont)
            
            Spacer()
            
            if animal.status == .paid {
                Label {
                    Text(Localization.AnimalRow.premium)
                        .foregroundColor(.red)
                        .font(Constants.titleFont)
                    
                } icon: {
                    Assets.iconLock.swiftUIImage
                        .foregroundColor(.red)
                        .frame(width: 10)
                }
            }
        }
        .padding()
    }
    
    func getOverlay() -> some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Assets.imageComingSoon.swiftUIImage
            }
            
            Spacer()
        }
        .background {
            Color(Constants.overlayColor)
                .cornerRadius(Constants.cornerRadius)
        }
    }
}

// MARK: - Static Properties
private struct Constants {
    static let imageSize: CGFloat = 90
    static let titleFont: Font = .system(size: 16)
    static let descriptionFont: Font = .system(size: 12)
    static let cornerRadius: CGFloat = 6
    static let overlayColor: UIColor = .black.withAlphaComponent(0.6)
}
