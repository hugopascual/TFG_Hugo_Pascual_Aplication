//
//  ProfileInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProfileInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProfileInteractorOutputProtocol? { return super.basePresenter as? ProfileInteractorOutputProtocol }
	
	var assemblyDTO: ProfileAssemblyDTO?
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProfileInteractor: ProfileInteractorInputProtocol {

}
