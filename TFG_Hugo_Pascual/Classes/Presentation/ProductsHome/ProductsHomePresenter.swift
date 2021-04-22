//  
//  ProductsHomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import Foundation

protocol ProductsHomePresenterProtocol: BasePresenterProtocol {
	func getCellsNumber() -> Int
	func getCellViewModelForIndex(index: Int) -> ProductsHomeCategoryCellViewModel
	func didRowPressed(index: Int)
	func addProductButtonPressed()
}

protocol ProductsHomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class ProductsHomePresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsHomeViewControllerProtocol? { return super.baseView as? ProductsHomeViewControllerProtocol }
	var router: ProductsHomeRouterProtocol? { return super.baseRouter as? ProductsHomeRouterProtocol }
	var interactor: ProductsHomeInteractorInputProtocol? { return super.baseInteractor as? ProductsHomeInteractorInputProtocol }
	
	var viewModel = ProductsHomeViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsHomePresenter: ProductsHomePresenterProtocol {
		
	func getCellsNumber() -> Int {
		self.viewModel.categoryCells.count
	}
	
	func getCellViewModelForIndex(index: Int) -> ProductsHomeCategoryCellViewModel {
		self.viewModel.categoryCells[index]
	}
	
	func didRowPressed(index: Int) {
		let type = self.viewModel.categoryCells[index].category
		self.router?.navigateToProductsList()
	}
	
	func addProductButtonPressed() {
		
	}
}

extension ProductsHomePresenter: ProductsHomeInteractorOutputProtocol {
	
}
