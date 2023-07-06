//
//  ProgLangModel.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 03/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import Foundation

struct ProgLanguages {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [ItemDetail]
}

struct ItemDetail: Codable {
    var itemId: Int
    var fullName: String?
    var owner: OwnerDetails
    var description: String?
    var language: String?
    
    enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case fullName = "full_name"
        case owner, description, language
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        itemId = try values.decode(Int.self, forKey: .itemId)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        owner = try values.decode(OwnerDetails.self, forKey: .owner)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        language = try values.decodeIfPresent(String.self, forKey: .language)
    }

}


struct OwnerDetails: Codable {
    var login: String?
}

extension ProgLanguages: Decodable {
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        items = try container.decode([ItemDetail].self, forKey: .items)
    }
}



//enum CodingKeys: String, CodingKey {
//    case totalCount = "total_count"
//    case incompleteResults = "incomplete_results"
//}


