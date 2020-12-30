//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	func profileNavigationBarButtonPressed()
	func getHome()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func setHome(businessModel: HomeBusinessModel)
}

class HomePresenter: BasePresenter {
	
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol}
	var interactor: HomeInteractorInputProtocol? { return super.baseInteractor as? HomeInteractorInputProtocol}
	var router: HomeRouterProtocol? { return super.baseRouter as? HomeRouterProtocol}
	
}

extension HomePresenter: HomePresenterProtocol {
	
	func profileNavigationBarButtonPressed() {
		router?.navigateToProfile()
	}
	
	func getHome() {
		self.interactor?.getHome()
	}
	
}

extension HomePresenter: HomeInteractorOutputProtocol {
	
	func setHome(businessModel: HomeBusinessModel) {
		let viewModel = HomeViewModel(businessModel: businessModel)
		
		self.view?.setView(viewModel: viewModel)
	}
}
