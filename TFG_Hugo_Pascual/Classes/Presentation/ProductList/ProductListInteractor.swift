//  
//  ProductListInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/02/2021.
//

import Foundation

protocol ProductListInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProductListInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductListInteractorOutputProtocol? { return super.basePresenter as? ProductListInteractorOutputProtocol }
	
	var assemblyDTO: ProductListAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductListInteractor: ProductListInteractorInputProtocol {
	
}
