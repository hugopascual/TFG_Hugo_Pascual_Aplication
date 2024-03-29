//  
//  LoginInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginInteractorInputProtocol: BaseInteractorInputProtocol {
	func login(email: String, password: String)
	func getEmail() -> String
	func getUsername() -> String
	
	var assemblyDTO: LoginAssemblyDTO? { get set }
}

class LoginInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: LoginInteractorOutputProtocol? { return super.basePresenter as? LoginInteractorOutputProtocol }
	
	var loginProvider: LoginProviderProtocol?
	
	var assemblyDTO: LoginAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginInteractor: LoginInteractorInputProtocol {

	func login(email: String, password: String) {
		
		let dto = LoginUserDTO(params: LoginUserDTO.Params(email: email, password: password))
		
		self.loginProvider?.loginUser(
			dto: dto,
			success: { serverModel in
				
				guard let businessModel = BaseInteractor.parseToBusinessModel(parserModel: UserBusinessModel.self, serverModel: serverModel) else { return }
				self.saveUserData(email: businessModel.email, username: businessModel.username, token: businessModel.token, id: businessModel.id)
				self.presenter?.loginSuccess()
			},
			failure: { error in
				self.presenter?.loginFailure(error: error)
			})
	}
	
	func getEmail() -> String {
		return DataPersisterHelper.standard.localUserData.email
	}
	
	func getUsername() -> String {
		return DataPersisterHelper.standard.localUserData.username
	}
}
