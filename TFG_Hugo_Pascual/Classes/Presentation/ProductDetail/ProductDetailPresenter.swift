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
	
	weak var view: ProductDetailViewProtocol? { return super.baseView as? ProductDetailViewProtocol}
	var interactor: ProductDetailInteractorInputProtocol? { return super.baseInteractor as? ProductDetailInteractorInputProtocol}
	var router: ProductDetailRouterProtocol? { return super.baseRouter as? ProductDetailRouterProtocol}
	
	var viewModel = ProductDetailViewModel()
	
	func viewDidLoad() {
		view?.setViewModel(viewModel)
	}
}

extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
}
