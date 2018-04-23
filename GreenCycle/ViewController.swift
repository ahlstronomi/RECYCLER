//
//  ViewController.swift
//  GreenCycle
//
//  Created by Doãn Hồng Ngọc on 18/04/2018.
//  Copyright © 2018 Nhim. All rights reserved.
//

import UIKit
typealias CategoryCompletionHandler = ([Category]?, Error?) -> Void

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
            
        loadCategories { categories, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let fetchedCategories = categories {
                self.categories = fetchedCategories
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 10
        cell.cellView.layer.masksToBounds = true
        
        
        let category = categories[indexPath.row]
        cell.categoryName.text = category.name.uppercased()
        
        if let imageUrl = category.imageUrl {
            cell.categoryImage.download(imageUrl)
        } else {
            cell.categoryImage.image = UIImage(named: "Placeholder")
        }
        
        cell.categoryImage.layer.cornerRadius = cell.categoryImage.frame.height / 10
        cell.categoryImage.layer.masksToBounds = true
    
        return cell
    }

    func loadCategories(completionHandler: @escaping CategoryCompletionHandler) {
        guard let url = URL(string: "http://localhost:8080/CategoryApp/webresources/categories") else {
            fatalError("Failed to create URL")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            } else {
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    DispatchQueue.main.async {
                        completionHandler(nil, nil)
                    }
                    return
                }
            }
            
            var categories: [Category] = []
            
            if let data = data, let fetchedCategories = try? JSONDecoder().decode([Category].self, from: data) {
                categories.append(contentsOf: fetchedCategories)
            }
            
            DispatchQueue.main.async {
                completionHandler(categories, nil)
            }
        }
        
        task.resume()
    }

}

