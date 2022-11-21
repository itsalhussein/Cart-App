//
//  ProductCell.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ProductCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    //MARK: - Properties
    private(set) var disposeBag = DisposeBag()

    var item: ProductModel! {
        didSet {
            setProductData()
        }
    }
    
    var cellIndex : Int?
    
    //MARK: - Life Cycle
    override func prepareForReuse() {
          super.prepareForReuse()
          disposeBag = DisposeBag() 
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        addToCartButton.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    private func setProductData() {
        productNameLabel.text = item.name
        cellIndex = item.id
        addToCartButton.tag = item.id
    }
}
