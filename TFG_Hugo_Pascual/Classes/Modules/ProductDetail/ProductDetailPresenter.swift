//  
//  ProductDetailPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductDetailPresenterProtocol: BasePresenterProtocol {
	func bottomButtonPressed()
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
	var isOwner: Bool?
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
		
		self.interactor?.getProductDetail()
	}
	
	func setUpBottomButton(owner: String) {
		if owner != DataPersisterHelper.standard.localUserData.username {
			self.isOwner = false
			self.view?.setBuyButton(title: self.viewModel.buyButtonTitle)
		} else {
			self.isOwner = true
			self.view?.setDeleteButton(title: self.viewModel.deleteButtonTitle)
		}
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailPresenter: ProductDetailPresenterProtocol {
	
	func bottomButtonPressed() {
		if self.isOwner ?? false {
			self.interactor?.deleteProduct()
		} else {
			print("COMENZAR PROCESO DE PAGO")
		}
	}
}

extension ProductDetailPresenter: ProductDetailInteractorOutputProtocol {
	
	func didGetProductDetailSuccess(businessModel: ProductBusinessModel) {
		self.viewModel.productModel = businessModel.model
		self.viewModel.productPrice = businessModel.price
		self.viewModel.productImageEncoded = businessModel.base64Image
		self.viewModel.productDescription = businessModel.description
		
		self.view?.setUpProductDetail(self.viewModel)
	
		self.setUpBottomButton(owner: businessModel.owner ?? "")
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
