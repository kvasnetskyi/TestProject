//
//  NavigationBarView.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - Internal Properties
    let title: String
    let action: () -> Void
    
    // MARK: Body
    var body: some View {
        HStack {
            Spacer()
            
            Text(title)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .overlay(alignment: .leading) {
            Button(Localization.back) {
                action()
            }
            .padding()
        }
    }
}

// MARK: - PreviewProvider
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Title", action: {})
    }
}
