//  
//  ProductDetailPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductDetailPresenterProtocol: BasePresenterProtocol {
	
}

protocol ProductDetailInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetProductDetailSuccess(businessModel: ProductBusinessModel)
	func didGetProdutDetialFail(error: CustomErrorModel)
}

class ProductDetailPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductDetailViewControllerProtocol? { return super.baseView as? ProductDetailViewControllerProtocol }
	var router: ProductDetailRouterProtocol? { return super.baseRouter as? ProductDetailRouterProtocol }
	var interactor: ProductDetailInteractorInputProtocol? { return super.baseInteractor as? ProductDetailInteractorInputProtocol }
	
	var viewModel = ProductDetailViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
		
		self.interactor?.getProductDetail()
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
	
	func didGetProductDetailSuccess(businessModel: ProductBusinessModel) {
		self.viewModel.productModel = businessModel.model
		self.viewModel.productPrice = businessModel.price
		self.viewModel.productImageEncoded = businessModel.base64Image
		self.viewModel.productDescription = businessModel.description
		
		self.view?.setUpProductDetail(self.viewModel)
	}
	
	func didGetProdutDetialFail(error: CustomErrorModel) {
		self.genericErrorHappened(error: error)
	}
}
