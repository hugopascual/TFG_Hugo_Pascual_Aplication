//  
//  ProductsUserListPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 09/05/2021.
//

import Foundation

protocol ProductsUserListPresenterProtocol: ProductsListPresenterProtocol {
	
}

protocol ProductsUserListInteractorOutputProtocol: ProductsListInteractorOutputProtocol {
	
}

class ProductsUserListPresenter: ProductsListPresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsListViewControllerProtocol? { return super.baseView as? ProductsListViewControllerProtocol }
	var router: ProductsListRouterProtocol? { return super.baseRouter as? ProductsListRouterProtocol }
	var interactor: ProductsUserListInteractorInputProtocol? { return super.baseInteractor as? ProductsUserListInteractorInputProtocol }
	
	// MARK: Private Functions
	override func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
		
		self.interactor?.getProductsUserList()
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsUserListPresenter: ProductsUserListPresenterProtocol {
	
}

extension ProductsUserListPresenter: ProductsUserListInteractorOutputProtocol {
	
}
