//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	func auxButtonPressed()
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {

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
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomePresenter: HomePresenterProtocol {
	
	func auxButtonPressed() {
		router?.navigateToAux()
	}
}

extension HomePresenter: HomeInteractorOutputProtocol {

}
