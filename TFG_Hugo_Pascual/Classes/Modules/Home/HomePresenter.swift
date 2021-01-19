//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	func productDetailButtonPressed()
	func getHome()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetHomeInfo(businessModel: HomeBusinessModel)
	func didNotGetHomeInfo()
}

class HomePresenter: BasePresenter {
	
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol}
	var interactor: HomeInteractorInputProtocol? { return super.baseInteractor as? HomeInteractorInputProtocol}
	var router: HomeRouterProtocol? { return super.baseRouter as? HomeRouterProtocol}
	
	var viewModel = HomeViewModel()
	
	func viewDidLoad() {
		self.getHome()
	}
	
	func configureAndSetViewModel(businessModel: HomeBusinessModel) {
		self.viewModel = HomeViewModel(businessModel: businessModel)
		self.view?.setViewModel(viewModel)
	}
}

extension HomePresenter: HomePresenterProtocol {
	
	func productDetailButtonPressed() {
		router?.navigateToProductDetail()
	}
	
	func getHome() {
		self.interactor?.getHome()
	}
}

extension HomePresenter: HomeInteractorOutputProtocol {
	
	func didGetHomeInfo(businessModel: HomeBusinessModel) {
		self.configureAndSetViewModel(businessModel: businessModel)
	}
	
	func didNotGetHomeInfo() {
		self.configureAndSetViewModel(businessModel: HomeBusinessModel())
	}
}
