//
//  ProductsTableViewController.swift
//  CoreDataDemo
//
//  Created by JordanLin on 2017/7/17.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    @IBOutlet var productsTableView: UITableView!
    
    let productManager = ProductManager()
    
    var products: [Product] = []
    
    var selectedRow: Int?

    
    func fetchDatesAndReloadTableView() {
        
        products = productManager.fetchProducts()
        
        productsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        fetchDatesAndReloadTableView()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchDatesAndReloadTableView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ProductTableViewCell

        cell.idLabel.text = "id: \(products[indexPath.row].id!)"
        
        cell.nameLabel.text = "name: \(products[indexPath.row].name!)"
        
        cell.priceLabel.text = "price: \(products[indexPath.row].price)"
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        selectedRow = indexPath.row
        
        return indexPath
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showEditViewController" {
            
            let destinationVC = segue.destination as! UpdateProductViewController
            
            destinationVC.indexOfRow = selectedRow
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            productManager.deleteProduct(indexPath: indexPath.row)
            
            fetchDatesAndReloadTableView()
            
        }
    }
}
