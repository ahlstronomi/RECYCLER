//
//  Layers.swift
//  GreenCycle
//
//  Created by Hồng Ngọc Doãn on 03/05/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit



extension CALayer {
   
    private struct Constants {
        static let contentLayerName = "contentLayerName"
    }
    
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
        
    }
    
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 10
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
        
    }
    
//    private func addShadowWithRoundedCorners() {
//        if let contents = self.contents {
//            masksToBounds = false
//            sublayers?.filter{ $0.frame.equalTo(self.bounds) }
//                .forEach{ $0.roundCorners(radius: self.cornerRadius) }
//            self.contents = nil
//            if let sublayer = sublayers?.first,
//                sublayer.name == Constants.contentLayerName {
//
//                sublayer.removeFromSuperlayer()
//            }
//            let contentLayer = CALayer()
//            contentLayer.name = Constants.contentLayerName
//            contentLayer.contents = contents
//            contentLayer.frame = bounds
//            contentLayer.cornerRadius = cornerRadius
//            contentLayer.masksToBounds = true
//            insertSublayer(contentLayer, at: 0)
//        }
//    }
}
