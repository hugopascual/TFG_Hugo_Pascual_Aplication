//  
//  RegistrationInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/02/2021.
//

import Foundation

protocol RegistrationInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class RegistrationInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: RegistrationInteractorOutputProtocol? { return super.basePresenter as? RegistrationInteractorOutputProtocol }
	
	var assemblyDTO: RegistrationAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationInteractor: RegistrationInteractorInputProtocol {
	
}
