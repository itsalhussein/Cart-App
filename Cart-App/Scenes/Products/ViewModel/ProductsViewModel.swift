//
//  ProductsViewModel.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ProductsViewModelProtocol {
    var items : PublishSubject<[ProductModel]> { get set }
    var cellHeight : CGFloat { get }
    var productArray : [ProductModel] { get set }
    func fetchProductList()
    func navigateToCart()
    func addProductToCart(product: ProductModel)
    func setInitialDateForCart()
}

class ProductsViewModel: ProductsViewModelProtocol {
    
    // MARK: - Properties
    var items = PublishSubject<[ProductModel]>()
    let cellHeight = CGFloat(120)
    var productArray = [
        ProductModel(id: 0, name: "iPhone 11 - 128 Gb", isAdded: false),
        ProductModel(id: 1, name: "iPhone 11 mini - 128 Gb", isAdded: false),
        ProductModel(id: 2, name: "iPhone 11 Pro - 128 Gb", isAdded: false),
        ProductModel(id: 3, name: "iPhone 11 Pro Max - 128 Gb", isAdded: false),
        ProductModel(id: 4, name: "iPhone 12 mini - 128 Gb", isAdded: false),
        ProductModel(id: 5, name: "iPhone 12 Pro - 128 Gb", isAdded: false),
        ProductModel(id: 6, name: "iPhone 12 Pro Max - 256 Gb", isAdded: false),
        ProductModel(id: 7, name: "iPhone 13 - 128 Gb", isAdded: false),
        ProductModel(id: 8, name: "iPhone 13 Pro Max - 512 Gb", isAdded: false),
        ProductModel(id: 9, name: "iPhone 14 - 128 Gb", isAdded: false),
        ProductModel(id: 10, name: "iPhone 14 Pro Max - 256 Gb", isAdded: false),
        ProductModel(id: 11, name: "iPhone 14 Pro - 512 Gb", isAdded: false),
        ProductModel(id: 12, name: "MacBook Air - M1", isAdded: false),
        ProductModel(id: 13, name: "MacBook Pro - M1", isAdded: false),
        ProductModel(id: 14, name: "MacBook Air - M2", isAdded: false),
        ProductModel(id: 15, name: "Macbook Pro - M2", isAdded: false),
        ProductModel(id: 16, name: "iMac - M1 - 512 Gb", isAdded: false),
        ProductModel(id: 17, name: "Mac Mini - 512 Gb", isAdded: false),
        ProductModel(id: 18, name: "iPhone Xs Max - 128 Gb", isAdded: false),
        ProductModel(id: 19, name: "iPhone X - 128 Gb", isAdded: false),
        ProductModel(id: 20, name: "iPhone 8 Plus - 128 Gb", isAdded: false),
        ProductModel(id: 21, name: "iPhone 7 - 128 Gb", isAdded: false),
        ProductModel(id: 22, name: "iPhone 7 Plus - 128 Gb", isAdded: false),
        ProductModel(id: 23, name: "iPhone 8 - 64 Gb", isAdded: false),
    ]
    
    // MARK: - Methods
    func fetchProductList() {
        items.onNext(productArray)
        items.onCompleted()
    }
    
    func navigateToCart() {
        try? AppNavigator().push(.cartVC)
    }
    
    func addProductToCart(product: ProductModel){
        DBHelper().saveProduct(newObj: product) { flag, errorMsg in
            switch flag {
            case true:
                print("Product Added successfully.")
            case false:
                print(errorMsg)
            }
        }
    }
    
    func setInitialDateForCart(){
        UserDefaultsConstants.initialDate = Date.now
    }
}
