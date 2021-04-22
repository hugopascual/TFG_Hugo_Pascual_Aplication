//  
//  AddProductPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol AddProductPresenterProtocol: BasePresenterProtocol {
	
}

protocol AddProductInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class AddProductPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: AddProductViewControllerProtocol? { return super.baseView as? AddProductViewControllerProtocol }
	var router: AddProductRouterProtocol? { return super.baseRouter as? AddProductRouterProtocol }
	var interactor: AddProductInteractorInputProtocol? { return super.baseInteractor as? AddProductInteractorInputProtocol }
	
	var viewModel = AddProductViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductPresenter: AddProductPresenterProtocol {
	
}

extension AddProductPresenter: AddProductInteractorOutputProtocol {
	
}
