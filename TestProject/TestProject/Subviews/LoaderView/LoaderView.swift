//
//  LoaderView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 06.10.2022.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
                .opacity(Constants.opacity)
            
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle()
                )
                .tint(.white)
                .scaleEffect(Constants.scale)
        }
    }
}

// MARK: - Static Properties
private struct Constants {
    static let opacity: CGFloat = 0.8
    static let scale: CGFloat = 3
}
