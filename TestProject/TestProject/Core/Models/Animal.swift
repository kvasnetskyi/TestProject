//
//  Animal.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

struct Animal: Decodable, Identifiable {
    // MARK: - Internal Properties
    let id = UUID()
    let title: String
    let description: String
    let image: URL
    let order: Int
    let status: Status
    var content: [AnimalContent]?
    
    // MARK: - CodingKey
    enum CodingKeys: String, CodingKey {
        case title, description, image, order, status, content
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(URL.self, forKey: .image)
        order = try container.decode(Int.self, forKey: .order)
        content = try? container.decode([AnimalContent].self, forKey: .content)
        
        let rawStatus = try container.decode(String.self, forKey: .status)
        
        guard let status = Status(rawValue: rawStatus) else {
            throw AppError.decoding
        }
        
        self.status = status
    }
    
    init(
        title: String,
        description: String,
        image: URL,
        order: Int,
        status: Status,
        content: [AnimalContent]? = nil
    ) {
        self.title = title
        self.description = description
        self.image = image
        self.order = order
        self.status = status
        self.content = content
    }
}

// MARK: - Models
extension Animal {
    enum Status: String {
        case paid, free
    }
}
