//
//  Image.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit

extension UIImageView {
    func download(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.sync {
                if let downloadedImage = UIImage(data: data) {
                    self.image = downloadedImage
                }
            }
        }
        
        task.resume()
    }
}
