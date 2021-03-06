//
//  SearchProductViewController.swift
//  CoreDataDemo
//
//  Created by JordanLin on 2017/7/17.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit

class SearchProductViewController: UIViewController {

    let productManager = ProductManager()
    @IBOutlet var searchResultsLabel: UILabel!
    @IBOutlet var productNameTextField: UITextField!

    @IBAction func searchTapped(_ sender: Any) {
        
        var results: String = ""
        
        let products = productManager.searchProduct(productName: productNameTextField.text!)
        
        for product in products {
            
            results.append("\(product.name!) \n")
            
        }
        
        searchResultsLabel.text = results
        
    }

}
