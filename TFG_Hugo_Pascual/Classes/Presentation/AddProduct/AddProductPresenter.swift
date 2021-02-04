//
//  AddProductPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation

protocol AddProductPresenterProtocol: BasePresenterProtocol {
	
}

protocol AddProductInteractorOutputProtocol: BaseInteractorOutputProtocol {

}

class AddProductPresenter: BasePresenter {
	
	weak var view: AddProductViewProtocol? { return super.baseView as? AddProductViewProtocol}
	var interactor: AddProductInteractorInputProtocol? { return super.baseInteractor as? AddProductInteractorInputProtocol}
	var router: AddProductRouterProtocol? { return super.baseRouter as? AddProductRouterProtocol}
	
	var viewModel = AddProductViewModel()
	
	func viewDidLoad() {
		view?.setViewModel(viewModel)
	}
}

extension AddProductPresenter: AddProductPresenterProtocol {
	
}

extension AddProductPresenter: AddProductInteractorOutputProtocol {
	
}
