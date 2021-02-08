//
//  ProductDetailInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation

protocol ProductDetailInteractorInputProtocol: BaseInteractorInputProtocol {

}

class ProductDetailInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductDetailInteractorOutputProtocol? { return super.basePresenter as? ProductDetailInteractorOutputProtocol }
	
	var assemblyDTO: ProductDetailAssemblyDTO?
	
	// MARK: Private Functions
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailInteractor: ProductDetailInteractorInputProtocol {
	
}
