//
//  CategoryInfoViewController.swift
//  GreenCycle
//
//  Created by Hồng Ngọc Doãn on 29/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit

class CategoryInfoViewController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var categoryImage: ImageViewWithGradient!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var shadowColor: UIColor? = UIColor.black
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 5
    var shadowOpacity: Float = 0.5
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex{
            
        case 0:
            NSLog("OK pressed")
            firstView.isHidden = false
            secondView.isHidden = true
            
        case 1:
            NSLog("NOT OK pressed")
            firstView.isHidden = true
            secondView.isHidden = false
            
        default:
            break
            
        }
    }
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the navigationBar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        infoView.layer.shadowColor = shadowColor?.cgColor
        infoView.layer.cornerRadius = 9
        infoView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        infoView.layer.shadowOpacity = 0.5
        infoView.layer.shadowRadius = 5.0 //Here your control your blur
        infoView.layer.masksToBounds =  false
        
        // Shows first view
        firstView.isHidden = false
        secondView.isHidden = true
        
        
        // Update UI
        updateUI(with: category)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Private methods
    fileprivate func updateUI(with category: Category?) {
        guard let category = category else { return }
        categoryImage.image = UIImage(named: category.image)
        categoryImage.updateGradientColor(category)
    }
}
