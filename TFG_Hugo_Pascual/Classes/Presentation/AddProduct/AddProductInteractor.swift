//  
//  AddProductInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol AddProductInteractorInputProtocol: BaseInteractorInputProtocol {
	func addProduct(product: ProductBusinessModel)
}

class AddProductInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: AddProductInteractorOutputProtocol? { return super.basePresenter as? AddProductInteractorOutputProtocol }
	
	var assemblyDTO: AddProductAssemblyDTO?
	var productProvider: ProductProviderProtocol?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductInteractor: AddProductInteractorInputProtocol {
	
	func addProduct(product: ProductBusinessModel) {
		self.productProvider?.addProduct(dto: AddProductParamsDTO(category: product.category?.rawValue,
																  model: product.model,
																  price: product.price,
																  description: product.description,
																  image: product.base64Image,
																  owner: product.owner?.username),
		success: {
			self.presenter?.didAddProductSucess()
		}, failure: { (_) in
			self.presenter?.didAddProductFailure()
		})
	}
}
