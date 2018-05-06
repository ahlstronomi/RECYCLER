//
//  ViewController.swift
//  InfoView
//
//  Created by Kendy on 22.4.2018.
//  Copyright © 2018 Metropolia. All rights reserved.
//

import UIKit

class CategoryInfoViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var categoryImage: ImageViewWithGradient!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var okCategoryDetailedInfoVC: CategoryDetailedInfoViewController?
    var notOkCategoryDetailedInfoVC: CategoryDetailedInfoViewController?
    
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
        
        //         Make the navigationBar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        infoView.layer.roundCorners(radius: 9)
        
        infoView.layer.masksToBounds =  true
        infoView.layer.shadowColor = shadowColor?.cgColor
        infoView.layer.shadowOffset = CGSize.zero  //Here you control x and y
        infoView.layer.shadowOpacity = 0.5
        infoView.layer.shadowRadius = 5.0 //Here your control your blur
        
        // Shows first view
        firstView.isHidden = false
        secondView.isHidden = true
        
        
        // Update UI
        updateUI(with: category)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        infoView.layer.roundCorners(radius: 9)
        infoView.layer.addShadow()
        infoView.layer.masksToBounds =  true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "OkInfoViewController" {
            okCategoryDetailedInfoVC = segue.destination as? CategoryDetailedInfoViewController
        } else if segue.identifier == "NotOkInfoViewController" {
            notOkCategoryDetailedInfoVC = segue.destination as? CategoryDetailedInfoViewController
        }
    }
    
    // MARK: Private methods
    
    fileprivate func updateUI(with category: Category?) {
        guard let category = category else { return }
        categoryImage.image = UIImage(named: category.image)
        categoryImage.updateGradientColor(category)
        segmentedControl.tintColor = UIColor(category.color1, 1.0)
        okCategoryDetailedInfoVC?.infoLabel.text = category.okInfo
        notOkCategoryDetailedInfoVC?.infoLabel.text = category.notOkInfo
    }
}
