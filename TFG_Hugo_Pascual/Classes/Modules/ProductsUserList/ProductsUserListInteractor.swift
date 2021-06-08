//  
//  ProductsUserListInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 09/05/2021.
//

import Foundation

protocol ProductsUserListInteractorInputProtocol: BaseInteractorInputProtocol {
	func getProductsUserList()
}

class ProductsUserListInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductsUserListInteractorOutputProtocol? { return super.basePresenter as? ProductsUserListInteractorOutputProtocol }
	
	var assemblyDTO: ProductsUserListAssemblyDTO?
	var productProvider: ProductProviderProtocol?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsUserListInteractor: ProductsUserListInteractorInputProtocol {
	
	func getProductsUserList() {
		self.productProvider?.getProductsUserList(
			dto: GetProductsUserListParamsDTO(email: DataPersisterHelper.standard.localUserData.email),
			success: { arrayServerModel in
				guard let arrayBusinessModel = BaseInteractor.parseArrayToBusinessModel(parserModel: [ProductBusinessModel].self, arrayServerModels: arrayServerModel) else { return }
				self.presenter?.didGetProductsListSuccess(arrayBusinessModel: arrayBusinessModel)
			},
			failure: { error in
				self.presenter?.didGetProductsListFail(error: error)
			})
	}
}
