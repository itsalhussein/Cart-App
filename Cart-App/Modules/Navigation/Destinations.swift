//
//  ProductsViewModel.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit

enum Destinations {
    case productsVC
    case cartVC
    
    var viewcontroller: UIViewController {
        switch self {
        
        case .productsVC:
            let viewModel = ProductsViewModel()
            return ProductsViewController(with: viewModel)
        case .cartVC:
            let viewModel = CartViewModel()
            return CartViewController(with: viewModel)
        }
    }
}
