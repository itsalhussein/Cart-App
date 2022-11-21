//
//  ProductsViewController.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ProductsViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var cartButton: UIButton!
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var viewModel: ProductsViewModelProtocol
    
    // MARK: - Initialization
    init(with viewModel: ProductsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupProductsTableView()
        configureBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchProductList()
    }
    
    
    //MARK: - Methods
    private func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Products"
        cartButton.layer.cornerRadius = cartButton.frame.width / 2
    }
    
    private func setupProductsTableView(){
        productsTableView.separatorStyle = .none
        productsTableView.register(ProductCell.nib, forCellReuseIdentifier: ProductCell.identifier)
    }
    
    private func configureBinding(){
        productsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.items.bind(to: productsTableView.rx.items(cellIdentifier: ProductCell.identifier, cellType: ProductCell.self)) { (row,item,cell) in
            cell.item = item
            
            cell.addToCartButton.rx.tap
                .subscribe(onNext: {[weak self] _ in
                    guard let self = self else { return }
                    self.viewModel.addProductToCart(product: item)
                    self.viewModel.setInitialDateForCart()
                }).disposed(by: cell.disposeBag)
            
        }.disposed(by: disposeBag)
        
        cartButton.rx.tap
            .subscribe(onNext: {[weak self] _ in
                guard let self = self else { return }
                self.viewModel.navigateToCart()
            }).disposed(by: disposeBag)
    }
}

//MARK: - UITableViewDelegate Method
extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
    
}
