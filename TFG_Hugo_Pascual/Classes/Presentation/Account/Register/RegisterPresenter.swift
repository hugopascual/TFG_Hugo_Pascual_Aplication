//  
//  RegisterPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegisterPresenterProtocol: BasePresenterProtocol {
	func registerButtonPressed(email: String, username: String, password: String)
}

protocol RegisterInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func userCreated()
	func userNotCreated(error: CustomErrorModel)
}

class RegisterPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: RegisterViewControllerProtocol? { return super.baseView as? RegisterViewControllerProtocol }
	var router: RegisterRouterProtocol? { return super.baseRouter as? RegisterRouterProtocol }
	var interactor: RegisterInteractorInputProtocol? { return super.baseInteractor as? RegisterInteractorInputProtocol }
	
	var viewModel = RegisterViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegisterPresenter: RegisterPresenterProtocol {
	
	func registerButtonPressed(email: String, username: String, password: String) {
		let dto = UserParamsDTO(email: email, username: username, password: password)
		self.interactor?.registerUser(dto: dto)
	}
}

extension RegisterPresenter: RegisterInteractorOutputProtocol {
	
	func userCreated() {
		
	}
	
	func userNotCreated(error: CustomErrorModel) {
		
	}
}
