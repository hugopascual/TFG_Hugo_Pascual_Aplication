//
//  ProductDetailPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation

protocol ProductDetailPresenterProtocol: BasePresenterProtocol {
	
}

protocol ProductDetailInteractorOutputProtocol: BaseInteractorOutputProtocol {

}

class ProductDetailPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductDetailViewProtocol? { return super.baseView as? ProductDetailViewProtocol}
	var interactor: ProductDetailInteractorInputProtocol? { return super.baseInteractor as? ProductDetailInteractorInputProtocol}
	var router: ProductDetailRouterProtocol? { return super.baseRouter as? ProductDetailRouterProtocol}
	
	var viewModel = ProductDetailViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		view?.setViewModel(viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
	
}
