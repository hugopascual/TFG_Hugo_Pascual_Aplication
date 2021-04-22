//  
//  ProductsHomeInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import Foundation

protocol ProductsHomeInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProductsHomeInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductsHomeInteractorOutputProtocol? { return super.basePresenter as? ProductsHomeInteractorOutputProtocol }
	
	var assemblyDTO: ProductsHomeAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsHomeInteractor: ProductsHomeInteractorInputProtocol {
	
}
