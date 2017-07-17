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
        let localProducts = productManager.searchProduct(productName: productNameTextField.text!)
        
        for localProduct in localProducts {
            results.append("\(localProduct.name) \n")
        }
        
        searchResultsLabel.text = results
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
