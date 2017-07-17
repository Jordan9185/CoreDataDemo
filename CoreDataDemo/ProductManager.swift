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
    
    func addProduct(product: Product) {

        let newProduct = Product(context: context)
        
        newProduct.id = product.id
        newProduct.name = product.name
        newProduct.price = product.price
        
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
