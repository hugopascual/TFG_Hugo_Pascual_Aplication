//  
//  RegistrationInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegistrationInteractorInputProtocol: BaseInteractorInputProtocol {
	func registrationUser(dto: RegisterUserDTO)
}

class RegistrationInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: RegistrationInteractorOutputProtocol? { return super.basePresenter as? RegistrationInteractorOutputProtocol }
	
	var registerProvider: RegisterProviderProtocol?
	
	var assemblyDTO: RegistrationAssemblyDTO??
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationInteractor: RegistrationInteractorInputProtocol {
	
	func registrationUser(dto: RegisterUserDTO) {
		self.registerProvider?.registerUser(dto: dto,
									  success: {
										self.presenter?.userCreated()
									  },
									  failure: { error in
										self.presenter?.userNotCreated(error: error)
									  })
	}
}
