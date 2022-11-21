//
//  UITableViewCell+Ex.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit

extension UITableViewCell{
    static var identifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
}
