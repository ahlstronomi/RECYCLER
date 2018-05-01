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
        
    }
    
    required init(coder aDecoder: NSCoder) {
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)!
        
    }
    
    func setup(_ color1: String,_ color2: String) {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        myGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        let colors: [CGColor] = [
            UIColor(hexString: color1, alpha: 0.8).cgColor,
            UIColor(hexString: color2, alpha: 0.9).cgColor
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
    func updateGradientColor(_ category: Category) {
        setup(category.color1, category.color2)
    }
}


