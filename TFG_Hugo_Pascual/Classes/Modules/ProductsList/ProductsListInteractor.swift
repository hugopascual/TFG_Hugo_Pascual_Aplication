//  
//  ProductsListInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListInteractorInputProtocol: BaseInteractorInputProtocol {
	func getProductsList()
}

class ProductsListInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductsListInteractorOutputProtocol? { return super.basePresenter as? ProductsListInteractorOutputProtocol }
	
	var assemblyDTO: ProductsListAssemblyDTO?
	var productProvider: ProductProviderProtocol?

	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListInteractor: ProductsListInteractorInputProtocol {
	
	func getProductsList() {
		guard let category = self.assemblyDTO?.listCategory else { return }
		self.productProvider?.getProductsList(
			dto: GetProductListParamsDTO(category: category.rawValue),
			success: { arrayServerModel in
				guard let arrayBusinessModel = BaseInteractor.parseArrayToBusinessModel(parserModel: [ProductBusinessModel].self, arrayServerModels: arrayServerModel) else { return }
				self.presenter?.didGetProductsListSuccess(arrayBusinessModel: arrayBusinessModel)
			},
			failure: { error in
				self.presenter?.didGetProductsListFail(error: error)
			})
	}
}
