//  
//  LoginPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginPresenterProtocol: BasePresenterProtocol {
	func loginButtonPressed(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func loginSucceeded()
	func loginNotSucceeded(error: CustomErrorModel)
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
	
	func loginButtonPressed(email: String, password: String) {
		let dto = UserParamsDTO(email: email, username: "", password: password)
		self.interactor?.loginUser(dto: dto)
	}
}

extension LoginPresenter: LoginInteractorOutputProtocol {
	func loginSucceeded() {
		print("USUARIO LOGADO")
	}
	
	func loginNotSucceeded(error: CustomErrorModel) {
		print(error)
	}
	
}
