//  
//  ProductChooseCategoryInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation

protocol ProductChooseCategoryInteractorInputProtocol: BaseInteractorInputProtocol {
	var assemblyDTO: ProductChooseCategoryAssemblyDTO? { get set }
}

class ProductChooseCategoryInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductChooseCategoryInteractorOutputProtocol? { return super.basePresenter as? ProductChooseCategoryInteractorOutputProtocol }
	
	var assemblyDTO: ProductChooseCategoryAssemblyDTO?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductChooseCategoryInteractor: ProductChooseCategoryInteractorInputProtocol {
	
}
