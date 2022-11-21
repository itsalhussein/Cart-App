//
//  CartViewModel.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol CartViewModelProtocol {
    var items : PublishSubject<[ProductModel]> { get }
    var cellHeight : CGFloat { get }
    func fetchCartList()
    func checkCartDuration()
}

class CartViewModel : CartViewModelProtocol {
    
    //MARK: - Properties
    var items = PublishSubject<[ProductModel]>()
    var cellHeight = CGFloat(88)
    
    //MARK: - Methods
    func fetchCartList() {
        var cartList:[ProductModel] = []
        DBHelper().retrieveCartProducts { data in
            cartList.append(contentsOf: data)
            print("DATA IS :-:",data)
        }
        items.onNext(cartList)
        items.onCompleted()
    }
    func checkCartDuration(){
        
        let dateAfterThreeDays = UserDefaultsConstants.initialDate.addingTimeInterval(259200)
        let todayDate = Date.now

        if todayDate >= dateAfterThreeDays {
            DBHelper().clearCart()
        }
    }
    
}
