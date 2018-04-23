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
        
        // Rounded corners in info layout
        self.infoView.layer.cornerRadius = 9
        self.infoView.layer.masksToBounds = true
        self.infoView.layer.borderColor = UIColor.black.cgColor
        self.infoView.layer.borderWidth = 1

        
    }

    
    // Hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

