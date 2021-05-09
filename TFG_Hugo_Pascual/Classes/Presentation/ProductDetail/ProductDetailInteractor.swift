//  
//  ProductDetailInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductDetailInteractorInputProtocol: BaseInteractorInputProtocol {
	func getProductDetail()
	func deleteProduct()
}

class ProductDetailInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: ProductDetailInteractorOutputProtocol? { return super.basePresenter as? ProductDetailInteractorOutputProtocol }
	
	var assemblyDTO: ProductDetailAssemblyDTO?
	var productProvider: ProductProviderProtocol?
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailInteractor: ProductDetailInteractorInputProtocol {
	
	func getProductDetail() {
		guard let productId = self.assemblyDTO?.productId else { return }
		self.productProvider?.getProductDetail(dto: GetProductDetailParamsDTO(id: productId),
											   success: { serverModel in
												guard let businessModel = BaseInteractor.parseToBusinessModel(parserModel: ProductBusinessModel.self, serverModel: serverModel) else { return }
												self.presenter?.didGetProductDetailSuccess(businessModel: businessModel)
											   },
											   failure: { error in
												self.presenter?.didGetProdutDetailFail(error: error)
											   })
	}
	
	func deleteProduct() {
		guard let productId = self.assemblyDTO?.productId else { return }
		self.productProvider?.deleteProduct(dto: DeleteProductParamsDTO(id: productId),
											success: {
												self.presenter?.didDeleteProductSuccess()
											},
											failure: { error in
												self.presenter?.didDeleteProductFail(error: error)
											})
	}
}
