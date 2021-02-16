//
//  MyProfileInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol MyProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class MyProfileInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: MyProfileInteractorOutputProtocol? { return super.basePresenter as? MyProfileInteractorOutputProtocol }
	
	var assemblyDTO: MyProfileAssemblyDTO?
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension MyProfileInteractor: MyProfileInteractorInputProtocol {

}
