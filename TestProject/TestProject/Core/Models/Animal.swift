//
//  Animal.swift
//  TestProject
//
//  Created by Artem Kvasnetskyi on 07.10.2022.
//

import Foundation

struct Animal: Decodable {
    let title: String
    let description: String
    let image: URL
    let order: Int
    let status: Status
    let content: [Content]?
    
    enum CodingKeys: String, CodingKey {
        case title, description, image, order, status, content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(URL.self, forKey: .image)
        order = try container.decode(Int.self, forKey: .order)
        content = try container.decode([Content]?.self, forKey: .content)
        
        let rawStatus = try container.decode(String.self, forKey: .title)
        
        guard let status = Status(rawValue: rawStatus) else {
            throw AppError.decoding
        }
        
        self.status = status
    }
}

extension Animal {
    enum Status: String {
        case paid, free
    }
    
    struct Content: Decodable {
        let fact: String
        let image: URL
    }
}
