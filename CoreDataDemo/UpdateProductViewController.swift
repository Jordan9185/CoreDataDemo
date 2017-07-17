//
//  UpdateProductViewController.swift
//  CoreDataDemo
//
//  Created by JordanLin on 2017/7/17.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit

class UpdateProductViewController: UIViewController {

    let productManager = ProductManager()
    @IBOutlet var productNameTextField: UITextField!
    
    @IBAction func searchTapped(_ sender: Any) {
 //       productManager.updateProduct(productName: productNameTextField.text!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
