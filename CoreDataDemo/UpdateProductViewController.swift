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
    var indexOfRow: Int?
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let products = productManager.fetchProducts()
        
        idTextField.text = products[indexOfRow!].id
        
        nameTextField.text = products[indexOfRow!].name
        
        priceTextField.text = "\(products[indexOfRow!].price)"
        
    }


    @IBAction func updateProductTapped(_ sender: Any) {
        
        productManager.updateProduct(
            indexPath: indexOfRow!,
            id: idTextField.text,
            name: nameTextField.text,
            price: Double(priceTextField.text!)
        )
        
        self.navigationController?.popViewController(animated: true)
    }
}
