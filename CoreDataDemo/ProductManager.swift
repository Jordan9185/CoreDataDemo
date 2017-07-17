//
//  File.swift
//  CoreDataDemo
//
//  Created by JordanLin on 2017/7/17.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

enum fetchDataError: Error {
    case fetchIdError, fetchNameError, fetchPriceError
}

class ProductManager {
    
    let context = appDelegate.persistentContainer.viewContext
    
    func addProduct(id: String, name: String, price: Double) {

        let newProduct = Product(context: context)

        newProduct.id = id
        newProduct.name = name
        newProduct.price = price
        
        appDelegate.saveContext()
        
    }
    
    func searchProduct(productName: String) -> [Product] {
        var products: [Product] = []
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.predicate = NSPredicate(format: "name contains %@", productName)
        
        do {
            
            products = try context.fetch(fetchRequest) as! [Product]

        } catch (let error) {
            print(error)
        }
            return products
    }
    
    func updateProduct(indexPath: Int, id:String?, name: String?, price: Double?) {
        let products = fetchProducts()
        
        if let productId = id {
            products[indexPath].id = productId
        }
        if let productName = name {
            products[indexPath].name = productName
        }
        if let productPrice = price {
            products[indexPath].price = productPrice
        }
        
        appDelegate.saveContext()
    }
    
    func fetchProducts() -> [Product] {
        var products: [Product] = []

        do {
            
            products = try context.fetch(Product.fetchRequest())
            
        } catch (let error) {
            print(error)
        }
        
        return products
    }
    
}
