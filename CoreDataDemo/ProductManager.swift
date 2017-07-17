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

struct LocalProduct {
    let id: String
    let name: String
    let price: Double
}

enum fetchDataError: Error {
    case fetchIdError, fetchNameError, fetchPriceError
}

class ProductManager {
    
    let context = appDelegate.persistentContainer.viewContext
    
    func addProduct(localProduct: LocalProduct) {

        let product = Product(context: context)
        
        product.id = localProduct.id
        product.name = localProduct.name
        product.price = localProduct.price
        
        appDelegate.saveContext()
        
    }
    
    func fetchProducts() -> [LocalProduct] {
        var products: [Product] = []
        var localProducts: [LocalProduct] = []
        
        do {
            
            products = try context.fetch(Product.fetchRequest())
    
            for product in products {
                guard let productId = product.id else { throw fetchDataError.fetchIdError}
                guard let productName = product.name else { throw fetchDataError.fetchNameError}

                localProducts.append(
                    LocalProduct(id: productId, name: productName, price: product.price)
                )

            }
            
        } catch (let error) {
            print(error)
        }
        
        return localProducts
    }
    
}
