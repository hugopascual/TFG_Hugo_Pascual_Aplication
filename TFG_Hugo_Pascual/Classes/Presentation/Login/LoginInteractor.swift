//  
//  LoginInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginInteractorInputProtocol: BaseInteractorInputProtocol {
	func loginUser(dto: UserParamsDTO)
}

class LoginInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: LoginInteractorOutputProtocol? { return super.basePresenter as? LoginInteractorOutputProtocol }
	
	var assemblyDTO: LoginAssemblyDTO?
	var userProvider: UserProviderProtocol?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginInteractor: LoginInteractorInputProtocol {
	
	func loginUser(dto: UserParamsDTO) {
		self.userProvider?.loginUser(dto: dto,
									  additionalHeaders: [:],
									  success: {
										self.presenter?.loginSucceeded()
									  },
									  failure: { error in
										self.presenter?.loginNotSucceeded(error: error)
									  })
	}
}
