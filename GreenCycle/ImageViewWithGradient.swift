//
//  ImageViewWithGradient.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 19/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit
import AVFoundation

class ImageViewWithGradient: UIImageView {
    let myGradientLayer: CAGradientLayer
    
    override init(frame: CGRect) {
        myGradientLayer = CAGradientLayer()
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)!
        self.setup()
    }
    
    func setupGradient(colors: [UIColor]) {
        
        // Invalidate the layer's content
        myGradientLayer.setNeedsDisplay()
        
    }
    
    func setup() {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        myGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        let colors: [CGColor] = [
            UIColor(hexString: "#9A8478", alpha: 0.8).cgColor,
            UIColor(hexString: "#1E130C", alpha: 0.9).cgColor
        ]
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        self.layer.addSublayer(myGradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myGradientLayer.frame = self.layer.bounds
    }
}

extension ImageViewWithGradient {
    func updateGradientColor(with category: Category){
        var color1: String
        var color2: String
        // Convert category name's to array of colors
        // Eg: switch category.name { }
        
        // Call setup(color:)
        
        // Done
        
        let categoryName = category.name.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//        let categoryType = CategoryType(rawValue: categoryName)
        
        switch categoryName {
        case "biowaste":
            color1 = "#1E130C"
            color2 = "#9A8478"
        case "metal":
            color1 = "#00C6FF"
            color2 = "#0072FF"
        case "mixedwaste":
            color1 = "232526"
            color2 = "414345"
        case "paper":
            color1 = "AAFFA9"
            color2 = "11FFBD"
        case "energywaste":
            color1 = "FE8C00"
            color2 = "F83600"
        case "hazardouswaste":
            color1 = "D31027"
            color2 = "EA384D"
        default:
            color1 = "#9A8478"
            color2 = "#1E130C"
        }
        
        
    }
}


