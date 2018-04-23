//
//  Category.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import Foundation

struct Category: Codable, Equatable {
    var id: Int
    var name: String
    var imageUrl: String?
}

enum CategoryType: String {
    case biowaste
    case metal
    case plastic
    case unknown
    
    init(rawValue: String) {
        switch rawValue.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
        case CategoryType.biowaste.rawValue:
            self = .biowaste
        case CategoryType.biowaste.rawValue:
            self = .metal
        case CategoryType.plastic.rawValue:
            self = .plastic
        default:
            self = .unknown
        }
    }
}
