//  
//  LoginPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginPresenterProtocol: BasePresenterProtocol {
	
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class LoginPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: LoginViewControllerProtocol? { return super.baseView as? LoginViewControllerProtocol }
	var router: LoginRouterProtocol? { return super.baseRouter as? LoginRouterProtocol }
	var interactor: LoginInteractorInputProtocol? { return super.baseInteractor as? LoginInteractorInputProtocol }
	
	var viewModel = LoginViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginPresenter: LoginPresenterProtocol {
	
}

extension LoginPresenter: LoginInteractorOutputProtocol {
	
}
