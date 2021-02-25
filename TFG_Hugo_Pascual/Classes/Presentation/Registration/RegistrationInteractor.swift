//  
//  RegistrationInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegistrationInteractorInputProtocol: BaseInteractorInputProtocol {
	func registrationUser(dto: UserParamsDTO)
}

class RegistrationInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: RegistrationInteractorOutputProtocol? { return super.basePresenter as? RegistrationInteractorOutputProtocol }
	
	var assemblyDTO: RegistrationAssemblyDTO?
	var userProvider: UserProviderProtocol?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationInteractor: RegistrationInteractorInputProtocol {
	
	func registrationUser(dto: UserParamsDTO) {
		self.userProvider?.createUser(dto: dto,
									  additionalHeaders: [:],
									  success: {
										self.presenter?.userCreated()
									  },
									  failure: { error in
										self.presenter?.userNotCreated(error: error)
									  })
	}
}
