//  
//  RegistrationPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegistrationPresenterProtocol: BasePresenterProtocol {
	func registrationButtonPressed(email: String, username: String, password: String)
}

protocol RegistrationInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func userCreated()
	func userNotCreated(error: CustomErrorModel)
}

class RegistrationPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: RegistrationViewControllerProtocol? { return super.baseView as? RegistrationViewControllerProtocol }
	var router: RegistrationRouterProtocol? { return super.baseRouter as? RegistrationRouterProtocol }
	var interactor: RegistrationInteractorInputProtocol? { return super.baseInteractor as? RegistrationInteractorInputProtocol }
	
	var viewModel = RegistrationViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationPresenter: RegistrationPresenterProtocol {
	
	func registrationButtonPressed(email: String, username: String, password: String) {
		let dto = RegisterUserDTO(params: RegisterUserDTO.Params(email: email, username: username, password: password))
		self.interactor?.registrationUser(dto: dto)
	}
}

extension RegistrationPresenter: RegistrationInteractorOutputProtocol {
	
	func userCreated() {
		self.router?.backToRoot()
	}
	
	func userNotCreated(error: CustomErrorModel) {
		
	}
}
