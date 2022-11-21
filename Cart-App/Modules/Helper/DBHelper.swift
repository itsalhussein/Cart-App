//
//  DBHelper.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import Foundation
import Disk

let PRODUCT_DATA = "product data"

class DBHelper{
    
    func saveProduct(newObj: ProductModel, compleation: @escaping ((_ flag: Bool, _ errorMsg: String) -> Void)) {
        do {
            try Disk.append(newObj, to: PRODUCT_DATA, in: .documents)
            compleation(true, "")
            
        } catch {
            print(error)
            compleation(false, error.localizedDescription)
        }
    }
    
    func retrieveCartProducts(compleation: @escaping ((_ data: [ProductModel]) -> Void)) {
        do{
            let retrieved = try Disk.retrieve(PRODUCT_DATA, from: .documents, as: [ProductModel].self)
            compleation(retrieved)
            
        } catch {
            print(error)
        }
    }
    
    
    func clearCart(){
        try? Disk.clear(.documents)
    }
    
    func isExist()->Bool{
        if Disk.exists(PRODUCT_DATA, in: .documents) {
            return true
        }
        return false
    }
    
}
