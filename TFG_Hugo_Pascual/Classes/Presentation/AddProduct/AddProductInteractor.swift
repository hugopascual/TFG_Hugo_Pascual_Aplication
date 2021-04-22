//  
//  AddProductInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol AddProductInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class AddProductInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: AddProductInteractorOutputProtocol? { return super.basePresenter as? AddProductInteractorOutputProtocol }
	
	var assemblyDTO: AddProductAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductInteractor: AddProductInteractorInputProtocol {
	
}
