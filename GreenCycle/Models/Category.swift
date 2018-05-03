//
//  Category.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import Foundation

struct Category: Codable {
    var id: Int
    var name: String
    var color1: String
    var color2: String
    var image: String
    var okInfo: String?
    var notOkInfo: String?
    
    static func getAllCategories() -> [Category]? {
        guard let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json"), let data = try? Data(contentsOf: fileUrl) else {
            return nil
        }
        
        var categories: [Category]?
        
        categories = try? JSONDecoder().decode([Category].self, from: data)
        
        return categories
    }
}
