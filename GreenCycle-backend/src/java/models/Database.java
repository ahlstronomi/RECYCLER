/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nhimbeobeo
 */
public class Database {
    
    private final List<Category> categories;
    
    private Database() {
        categories = new ArrayList<Category>();
        
        String baseUrl = "http://localhost:8080/GreenCycle-backend/webresources/images/";
        
        Category biowaste = new Category(0, "Biowaste", baseUrl + "biowaste.jpg");
        Category carton = new Category(1, "Carton", baseUrl + "carton.jpg");
        Category clothingAndOtherTextiles = new Category(2, "Clothing and other textiles", baseUrl + "clothingAndOtherTextiles.jpg");
        Category constructionWaste = new Category(3, "Construction waste", baseUrl + "constructionWaste.jpg");
        Category electricAndElectronicEquipment = new Category(4, "Electric and electronic equipment", baseUrl + "electricAndElectronicEquipment.jpg");
        Category energyWaste = new Category(5, "Energy waste");
        Category gardenWasteAndBrushwood = new Category(6, "Garden waste and brushwood", baseUrl + "gardenWasteAndBrushwood.jpg");
        Category glass = new Category(7, "Glass", baseUrl + "glass.jpg");
        Category hazardousWaste = new Category(8, "Hazardous waste", baseUrl + "hazardousWaste.jpg");
        Category largeObjects = new Category(9, "Large objects", baseUrl + "largeObjects.jpg");
        Category metals = new Category(10, "Metals", baseUrl + "metals.jpg");
        Category mixedWaste = new Category(11, "Mixed waste");
        Category paper = new Category(12, "Paper", baseUrl + "paper.jpg");
        Category plastic = new Category(13, "Plastic", baseUrl + "plastic.jpg");

        categories.add(biowaste);
        categories.add(carton);
        categories.add(clothingAndOtherTextiles);
        categories.add(constructionWaste);
        categories.add(electricAndElectronicEquipment);
        categories.add(energyWaste);
        categories.add(gardenWasteAndBrushwood);
        categories.add(glass);
        categories.add(hazardousWaste);
        categories.add(largeObjects);
        categories.add(metals);
        categories.add(mixedWaste);
        categories.add(paper);
        categories.add(plastic);
    }
    
    public static Database getInstance() {
        return new Database(); 
    } 
    
    public List<Category> getAllCategories() {
        return this.categories;
    }
}