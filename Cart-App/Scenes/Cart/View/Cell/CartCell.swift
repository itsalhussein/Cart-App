//
//  CartCell.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit

class CartCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    
    //MARK: - Properties
    var item: ProductModel! {
        didSet {
            setProductData()
        }
    }
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    private func setProductData() {
        productNameLabel.text = item.name
    }
    
    
}
