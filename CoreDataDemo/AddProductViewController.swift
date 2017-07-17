//
//  AddProductViewController.swift
//  CoreDataDemo
//
//  Created by JordanLin on 2017/7/17.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {

    let productManager = ProductManager()
    
    @IBOutlet var idTextField: UITextField!

    @IBOutlet var nameTextField: UITextField!

    @IBOutlet var priceTextField: UITextField!

    @IBAction func addProductTapped(_ sender: UIButton) {
        
        let product: Product = Product()
        
        guard
        let id = idTextField.text,
        let name = nameTextField.text,
        let price = priceTextField.text
        else {
            return
        }
        
        product.id = id
        product.name = name
        product.price = Double(price)!
        
        productManager.addProduct(product: product)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
