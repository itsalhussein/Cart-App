//
//  CartViewController.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit
import RxCocoa
import RxSwift

class CartViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var cartTableView: UITableView!
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let viewModel: CartViewModelProtocol
    
    // MARK: - Initialization
    init(with viewModel: CartViewModelProtocol) {
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
        setupCartTableView()
        configureBinding()
        viewModel.checkCartDuration()
        viewModel.fetchCartList()
    }
    
    
    //MARK: - Methods
    private func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Cart"
    }
    
    private func setupCartTableView(){
        cartTableView.separatorStyle = .none
        cartTableView.register(CartCell.nib, forCellReuseIdentifier: CartCell.identifier)
    }
    
    private func configureBinding(){
        cartTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.items.bind(to: cartTableView.rx.items(cellIdentifier: CartCell.identifier, cellType: CartCell.self)) { (row,item,cell) in
            cell.item = item
        }.disposed(by: disposeBag)
    }

}


//MARK: - UITableViewDelegate Method
extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
    
}
