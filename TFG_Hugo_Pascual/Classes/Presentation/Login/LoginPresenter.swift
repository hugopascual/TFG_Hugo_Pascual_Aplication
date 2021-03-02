//  
//  LoginPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginPresenterProtocol: BasePresenterProtocol {
	func registrationButtonPressed()
	func loginButtonPressed(email: String?, password: String?)
}

protocol LoginInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func loginSuccess()
	func loginFailure(error: CustomErrorModel)
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
	
	override func showError(error: CustomErrorModel) {
		
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginPresenter: LoginPresenterProtocol {
	
	func registrationButtonPressed() {
		self.router?.navigateToRegistration()
	}
	
	func loginButtonPressed(email: String?, password: String?) {
		self.interactor?.login(email: email ?? "", password: password ?? "")
	}
}

extension LoginPresenter: LoginInteractorOutputProtocol {
	
	func loginSuccess() {
		self.router?.backToPreviousScreen(completion: {
			if let loginSuccess = self.interactor?.assemblyDTO?.loginSuccess {
				loginSuccess()
			}
		})
	}

	func loginFailure(error: CustomErrorModel) {
		
	}
}
