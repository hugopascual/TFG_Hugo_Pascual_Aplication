//  
//  ProductsListInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProductsListInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductsListInteractorOutputProtocol? { return super.basePresenter as? ProductsListInteractorOutputProtocol }
	
	var assemblyDTO: ProductsListAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListInteractor: ProductsListInteractorInputProtocol {
	
}
