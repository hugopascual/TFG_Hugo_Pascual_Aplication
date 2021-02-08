//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	func productDetailButtonPressed()
//	func getHome()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
//	func didGetHomeInfo(businessModel: HomeBusinessModel)
//	func didNotGetHomeInfo()
}

class HomePresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol}
	var interactor: HomeInteractorInputProtocol? { return super.baseInteractor as? HomeInteractorInputProtocol}
	var router: HomeRouterProtocol? { return super.baseRouter as? HomeRouterProtocol}
	
	var viewModel = HomeViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(self.viewModel)
//		self.getHome()
	}
	
//	func setInteractorData(businessModel: HomeBusinessModel) {
//		self.view?.setServiceData(businessModel: businessModel)
//	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomePresenter: HomePresenterProtocol {
	
	func productDetailButtonPressed() {
		router?.navigateToProductDetail()
	}
	
//	func getHome() {
//		self.interactor?.getHome()
//	}
}

extension HomePresenter: HomeInteractorOutputProtocol {
	
//	func didGetHomeInfo(businessModel: HomeBusinessModel) {
//		self.setInteractorData(businessModel: businessModel)
//	}
//
//	func didNotGetHomeInfo() {
//
//	}
}
