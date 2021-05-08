//  
//  ProductsListPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListPresenterProtocol: BasePresenterProtocol {
	
}

protocol ProductsListInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetProductListSuccess(arrayBusinessModel: [ProductBusinessModel])
	func didGetProductListFail(error: CustomErrorModel)

}

class ProductsListPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsListViewControllerProtocol? { return super.baseView as? ProductsListViewControllerProtocol }
	var router: ProductsListRouterProtocol? { return super.baseRouter as? ProductsListRouterProtocol }
	var interactor: ProductsListInteractorInputProtocol? { return super.baseInteractor as? ProductsListInteractorInputProtocol }
	
	var viewModel = ProductsListViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListPresenter: ProductsListPresenterProtocol {
	
}

extension ProductsListPresenter: ProductsListInteractorOutputProtocol {
	
	func didGetProductListSuccess(arrayBusinessModel: [ProductBusinessModel]) {
		
	}
	
	func didGetProductListFail(error: CustomErrorModel) {
		self.genericErrorHappened(error: error)
	}
}
