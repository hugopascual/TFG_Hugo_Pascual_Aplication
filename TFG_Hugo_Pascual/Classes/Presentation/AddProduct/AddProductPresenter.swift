//  
//  AddProductPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol AddProductPresenterProtocol: BasePresenterProtocol {
	func chooseCategoryButtonPressed()
	func imageSelected(imageEncoded: String)
	func addProductButtonPressed(model: String, price: String, description: String)
}

protocol AddProductInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didAddProductSucess()
	func didAddProductFailure(error: CustomErrorModel)
}

class AddProductPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: AddProductViewControllerProtocol? { return super.baseView as? AddProductViewControllerProtocol }
	var router: AddProductRouterProtocol? { return super.baseRouter as? AddProductRouterProtocol }
	var interactor: AddProductInteractorInputProtocol? { return super.baseInteractor as? AddProductInteractorInputProtocol }
	
	var viewModel = AddProductViewModel()
	var productToBeAdded = ProductBusinessModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension AddProductPresenter: AddProductPresenterProtocol {
	
	func chooseCategoryButtonPressed() {
		self.router?.presentChooseCategoryModal(dto: ProductChooseCategoryAssemblyDTO(
													categorySelected: { (category) in
														self.view?.setCategory(category)
														self.productToBeAdded.category = category
													}
		))
	}
	
	func imageSelected(imageEncoded: String) {
		self.productToBeAdded.base64Image = imageEncoded
		if !imageEncoded.isEmpty {
			self.view?.imageAttached(text: self.viewModel.attachedImage)
		}
	}
	
	func addProductButtonPressed(model: String, price: String, description: String) {
		guard self.productToBeAdded.category != nil else { return }
		self.productToBeAdded.model = model
		self.productToBeAdded.price = price
		self.productToBeAdded.description = description
		self.productToBeAdded.owner = DataPersisterHelper.standard.localUserData.username
//		self.productToBeAdded.base64Image = Utils.imgBase64Encoding(ImagesNamesConstants.no_category_icon)
		
		self.interactor?.addProduct(product: self.productToBeAdded)
	}
}

extension AddProductPresenter: AddProductInteractorOutputProtocol {
	
	func didAddProductSucess() {
		self.router?.back()
	}
	
	func didAddProductFailure(error: CustomErrorModel) {
		self.genericErrorHappened(error: error)
	}
}
