//  
//  ProductDetailPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductDetailPresenterProtocol: BasePresenterProtocol {
	func deleteButtonPressed()
}

protocol ProductDetailInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetProductDetailSuccess(businessModel: ProductBusinessModel)
	func didGetProdutDetailFail(error: CustomErrorModel)
	func didDeleteProductSuccess()
	func didDeleteProductFail(error: CustomErrorModel)
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
	
	func setUpBottomButton(owner: String) {
		if owner == DataPersisterHelper.standard.localUserData.email {
			self.view?.setDeleteButton(title: self.viewModel.deleteButtonTitle)
		} else {
			self.view?.hideDeleteButton()
		}
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
	func deleteButtonPressed() {
		self.interactor?.deleteProduct()
	}
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
	
	func didGetProductDetailSuccess(businessModel: ProductBusinessModel) {
		self.viewModel.productModel = businessModel.model
		self.viewModel.productPrice = businessModel.price
		self.viewModel.productImageEncoded = businessModel.base64Image
		self.viewModel.productDescription = businessModel.description
		self.viewModel.ownerContactEmail = businessModel.ownerEmail
		
		self.view?.setUpProductDetail(self.viewModel)
	
		self.setUpBottomButton(owner: businessModel.ownerEmail ?? "")
	}
	
	func didGetProdutDetailFail(error: CustomErrorModel) {
		self.genericErrorHappened(error: error)
	}
	
	func didDeleteProductSuccess() {
		self.view?.showToast(viewModel: ToastViewModel(type: .success, title: viewModel.deleteProductSucess))
		self.router?.navigateToHome()
	}
	
	func didDeleteProductFail(error: CustomErrorModel) {
		self.view?.showToast(viewModel: ToastViewModel(type: .error, title: viewModel.deleteProductError))
		self.genericErrorHappened(error: error)
	}
}
