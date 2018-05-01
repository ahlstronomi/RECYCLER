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
    
    var categories: [Category] = []

    var biowaste = Category(id: 0, name: "Biowaste", color1: "#9A8478", color2: "#1E130C", image: "biowaste")
    var carton = Category(id: 1, name: "Carton", image: "carton");
    var clothingAndOtherTextiles = Category(id: 2, name: "Clothing and other textiles", image: "clothingAndOtherTextiles");
    var constructionWaste = Category(id: 3, name: "Construction waste", image: "constructionWaste");
    var electricAndElectronicEquipment = Category(id: 4, name: "Electric and electronic equipment", image: "electricAndElectronicEquipment");
    var energyWaste = Category(id: 5, name: "Energy waste", color1: "#FE8C00", color2: "#F83600", image: "energyWaste");
    var gardenWasteAndBrushwood = Category(id: 6, name: "Garden waste and brushwood", image: "gardenWasteAndBrushwood");
    var glass = Category(id: 7, name: "Glass", image: "glass.jpg");
    var hazardousWaste = Category(id: 8, name: "Hazardous waste", color1: "#EA384D", color2: "#D31027", image: "hazardousWaste");
    var largeObjects = Category(id: 9, name: "Large objects", image: "largeObjects");
    var metals = Category(id: 10, name: "Metals", color1: "#00C6FF", color2: "#0072FF", image: "metals");
    var mixedWaste = Category(id: 11, name: "Mixed waste", color1: "#414345", color2: "#232526", image: "mixedWaste");
    var paper = Category(id: 12, name: "Paper", color1: "#AAFFA9", color2: "#11FFBD", image: "paper");
    var plastic = Category(id: 13, name: "Plastic", image: "plastic");
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Make the navigationBar transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        categories.append(biowaste);
        categories.append(carton);
        categories.append(clothingAndOtherTextiles);
        categories.append(constructionWaste);
        categories.append(electricAndElectronicEquipment);
        categories.append(energyWaste);
        categories.append(gardenWasteAndBrushwood);
        categories.append(glass);
        categories.append(hazardousWaste);
        categories.append(largeObjects);
        categories.append(metals);
        categories.append(mixedWaste);
        categories.append(paper);
        categories.append(plastic);
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        let category = categories[indexPath.row]
        cell.categoryName.text = category.name.uppercased()
        cell.categoryImage.image = UIImage(named: category.image)
        cell.categoryImage.updateGradientColor(category)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriesViewToCategoryInfoView" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let category = categories[indexPath.row]
            
            if let controller = segue.destination as? CategoryInfoViewController {
                controller.category = category
            }
        }
    }
}

