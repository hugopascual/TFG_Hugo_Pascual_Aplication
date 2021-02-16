//  
//  RegisterInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol RegisterInteractorInputProtocol: BaseInteractorInputProtocol {
	func registerUser(dto: UserParamsDTO)
}

class RegisterInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: RegisterInteractorOutputProtocol? { return super.basePresenter as? RegisterInteractorOutputProtocol }
	
	var assemblyDTO: RegisterAssemblyDTO?
	var userProvider: UserProvider?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegisterInteractor: RegisterInteractorInputProtocol {
	
	func registerUser(dto: UserParamsDTO) {
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
