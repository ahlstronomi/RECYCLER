//
//  ViewController.swift
//  InfoView
//
//  Created by iosdev on 22.4.2018.
//  Copyright © 2018 Metropolia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Shows first view
        secondView.isHidden = true
        firstView.isHidden = false
        
        // Rounded corners and shadows in info layout
        self.infoView.layer.cornerRadius = 9
        self.infoView.layer.masksToBounds = true
        self.infoView.layer.shadowColor = shadowColor?.cgColor
        self.infoView.layer.cornerRadius = 2
        self.infoView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        self.infoView.layer.shadowOpacity = 0.5
        self.infoView.layer.shadowRadius = 5.0 //Here your control your blur
        self.infoView.layer.masksToBounds =  false


    }

    
    // Hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

