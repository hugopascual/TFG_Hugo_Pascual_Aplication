//  
//  LoginInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

protocol LoginInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class LoginInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: LoginInteractorOutputProtocol? { return super.basePresenter as? LoginInteractorOutputProtocol }
	
	var assemblyDTO: LoginAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension LoginInteractor: LoginInteractorInputProtocol {
	
}
