//  
//  ProductsListPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListPresenterProtocol: BasePresenterProtocol {
	func getCellsNumber() -> Int
	func getCellViewModelForIndex(index: Int) -> ProductsListCellViewModel
	func didRowPressed(index: Int)
}

protocol ProductsListInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetProductsListSuccess(arrayBusinessModel: [ProductBusinessModel])
	func didGetProductsListFail(error: CustomErrorModel)
}

class ProductsListPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	private weak var view: ProductsListViewControllerProtocol? { return super.baseView as? ProductsListViewControllerProtocol }
	private var router: ProductsListRouterProtocol? { return super.baseRouter as? ProductsListRouterProtocol }
	private var interactor: ProductsListInteractorInputProtocol? { return super.baseInteractor as? ProductsListInteractorInputProtocol }
	
	var viewModel = ProductsListViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.interactor?.getProductsList()
		
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListPresenter: ProductsListPresenterProtocol {
	
	func getCellsNumber() -> Int {
		self.viewModel.productCells.count
	}
	
	func getCellViewModelForIndex(index: Int) -> ProductsListCellViewModel {
		self.viewModel.productCells[index]
	}
	
	func didRowPressed(index: Int) {
		guard let id = self.viewModel.productCells[index].id else { return }
		self.router?.navigateToProductDetail(id: id)
	}
}

extension ProductsListPresenter: ProductsListInteractorOutputProtocol {
	
	func didGetProductsListSuccess(arrayBusinessModel: [ProductBusinessModel]) {
		arrayBusinessModel.forEach { businessModel in
			self.viewModel.productCells.append(ProductsListCellViewModel(id: businessModel.id,
																		image: businessModel.base64Image,
																		title: businessModel.model,
																		price: businessModel.price))
		}
		self.view?.refreshTableData()
	}
	
	func didGetProductsListFail(error: CustomErrorModel) {
		self.genericErrorHappened(error: error)
	}
}
