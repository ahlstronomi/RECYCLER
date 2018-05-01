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
    var color1: String = "#414345"
    var color2: String = "#232526"
    var image: String
//    var okInfo: String
//    var notOkInfo: String
    
    init(id: Int,
        name: String,
        color1: String,
        color2: String,
        image: String
        ) {
        
        self.id = id
        self.name = name
        self.color1 = color1
        self.color2 = color2
        self.image = image
//        self.okInfo = okInfo
//        self.notOkInfo = notOkInfo
    }
    
    init(id: Int,
         name: String,
         image: String) {
        
        self.id = id
        self.name = name
        self.image = image
    }
}
