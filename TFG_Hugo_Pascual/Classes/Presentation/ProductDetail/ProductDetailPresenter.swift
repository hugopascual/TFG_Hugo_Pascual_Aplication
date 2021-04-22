//  
//  ProductDetailPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductDetailPresenterProtocol: BasePresenterProtocol {
	
}

protocol ProductDetailInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class ProductDetailPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductDetailViewControllerProtocol? { return super.baseView as? ProductDetailViewControllerProtocol }
	var router: ProductDetailRouterProtocol? { return super.baseRouter as? ProductDetailRouterProtocol }
	var interactor: ProductDetailInteractorInputProtocol? { return super.baseInteractor as? ProductDetailInteractorInputProtocol }
	
	var viewModel = ProductDetailViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
	
}
