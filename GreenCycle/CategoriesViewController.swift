//
//  ViewController.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit
typealias CategoryCompletionHandler = ([Category]?, Error?) -> Void

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category]?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Make the navigationBar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        categories = Category.getAllCategories()
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let categories = categories else {
            return 0
        }
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        if let categories = categories {
            let category = categories[indexPath.row]
            cell.categoryName.text = category.name.uppercased()
            cell.categoryImage.image = UIImage(named: category.image)
            cell.categoryImage.updateGradientColor(category)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriesViewToCategoryInfoView" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            guard let categories = categories else {
                return
            }
            
            let category = categories[indexPath.row]
            
            if let controller = segue.destination as? CategoryInfoViewController {
                controller.category = category
            }
        }
    }
}

