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
    var localProducts: [LocalProduct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        localProducts = productManager.fetchProducts()
        
        productsTableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return localProducts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ProductTableViewCell

        cell.idLabel.text = "id: \(localProducts[indexPath.row].id)"
        cell.nameLabel.text = "name: \(localProducts[indexPath.row].name)"
        cell.priceLabel.text = "price: \(localProducts[indexPath.row].price)"
        
        return cell
    }
}
