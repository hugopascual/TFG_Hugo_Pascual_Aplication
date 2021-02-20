//  
//  ProductListPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/02/2021.
//

import Foundation

protocol ProductListPresenterProtocol: BasePresenterProtocol {
	
}

protocol ProductListInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class ProductListPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductListViewControllerProtocol? { return super.baseView as? ProductListViewControllerProtocol }
	var router: ProductListRouterProtocol? { return super.baseRouter as? ProductListRouterProtocol }
	var interactor: ProductListInteractorInputProtocol? { return super.baseInteractor as? ProductListInteractorInputProtocol }
	
	var viewModel = ProductListViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductListPresenter: ProductListPresenterProtocol {
	
}

extension ProductListPresenter: ProductListInteractorOutputProtocol {
	
}
