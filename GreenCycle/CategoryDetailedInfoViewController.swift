//
//  CategoryDetailedInfoViewController.swift
//  GreenCycle
//
//  Created by Hồng Ngọc Doãn on 06/05/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit

class CategoryDetailedInfoViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.sizeToFit()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
