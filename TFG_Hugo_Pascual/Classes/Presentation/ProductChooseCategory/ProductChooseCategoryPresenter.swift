//  
//  ProductChooseCategoryPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation

protocol ProductChooseCategoryPresenterProtocol: BasePresenterProtocol {
	func getCellsNumber() -> Int
	func getCellViewModelForIndex(index: Int) -> ProductsHomeCategoryCellViewModel
	func didRowPressed(index: Int)
	func closeModalButtonPressed()
}

protocol ProductChooseCategoryInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class ProductChooseCategoryPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductChooseCategoryViewControllerProtocol? { return super.baseView as? ProductChooseCategoryViewControllerProtocol }
	var router: ProductChooseCategoryRouterProtocol? { return super.baseRouter as? ProductChooseCategoryRouterProtocol }
	var interactor: ProductChooseCategoryInteractorInputProtocol? { return super.baseInteractor as? ProductChooseCategoryInteractorInputProtocol }
	
	var viewModel = ProductChooseCategoryViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductChooseCategoryPresenter: ProductChooseCategoryPresenterProtocol {

	func getCellsNumber() -> Int {
		self.viewModel.categoryCells.count
	}
	
	func getCellViewModelForIndex(index: Int) -> ProductsHomeCategoryCellViewModel {
		self.viewModel.categoryCells[index]
	}
	
	func didRowPressed(index: Int) {
		if let categorySelected = self.interactor?.assemblyDTO?.categorySelected {
			categorySelected(self.viewModel.categoryCells[index].category ?? .other)
		}
		self.router?.navigateBack()
	}
	
	func closeModalButtonPressed() {
		self.router?.navigateBack()
	}
}

extension ProductChooseCategoryPresenter: ProductChooseCategoryInteractorOutputProtocol {
	
}
