//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	func profileNavigationBarButtonPressed()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class HomePresenter: BasePresenter {
	
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol}
	var interactor: HomeInteractorOutputProtocol? { return super.baseInteractor as? HomeInteractorOutputProtocol}
	var router: HomeRouterProtocol? { return super.baseRouter as? HomeRouterProtocol}
	
}

extension HomePresenter: HomePresenterProtocol {
	
	func profileNavigationBarButtonPressed() {
		router?.navigateToProfile()
	}
	
}

extension HomePresenter: HomeInteractorOutputProtocol {
	
}
