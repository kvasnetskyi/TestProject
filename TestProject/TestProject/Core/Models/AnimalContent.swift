//
//  AnimalContent.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

struct AnimalContent: Decodable, Hashable, Identifiable {
    let id = UUID()
    let fact: String
    let image: URL
    
    // MARK: - CodingKey
    enum CodingKeys: String, CodingKey {
        case fact, image
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fact = try container.decode(String.self, forKey: .fact)
        image = try container.decode(URL.self, forKey: .image)
    }
    
    init(fact: String, image: URL) {
        self.fact = fact
        self.image = image
    }
}
