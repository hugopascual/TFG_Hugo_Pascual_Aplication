//
//  MyProfileInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol MyProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	func logout()
}

class MyProfileInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: MyProfileInteractorOutputProtocol? { return super.basePresenter as? MyProfileInteractorOutputProtocol }
	
	var loginProvider: LoginProviderProtocol?
	
	var assemblyDTO: MyProfileAssemblyDTO?
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension MyProfileInteractor: MyProfileInteractorInputProtocol {

	func logout() {
		self.loginProvider?.logoutUser(dto: LogoutUserDTO(),
									  success: {
										self.removeDataForLogout()
										self.presenter?.logoutSucess()
									  }, failure: { _ in
										self.removeDataForLogout()
										self.presenter?.logoutFailure()
									})
	}
}
