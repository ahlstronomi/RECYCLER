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
    
    func setup() {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        myGradientLayer.endPoint = CGPoint(x: 1, y: 1)
        let colors: [CGColor] = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor,
        ]
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        myGradientLayer.locations = [0.0, 0.3, 0.5, 0.7, 1.0]
        self.layer.addSublayer(myGradientLayer)
    }
    
    override func layoutSubviews() {
        myGradientLayer.frame = self.layer.bounds
    }
}
