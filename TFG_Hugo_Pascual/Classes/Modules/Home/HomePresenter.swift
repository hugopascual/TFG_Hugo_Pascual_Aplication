//
//  HomePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
	
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class HomePresenter: BasePresenter {
	
	weak var view: HomeViewProtocol? { return super.baseView as? HomeViewProtocol}
	var interactor: HomeInteractorOutputProtocol? { return super.baseView as? HomeInteractorOutputProtocol}
	var router: HomeRouterProtocol? { return super.baseView as? HomeRouterProtocol}
	
}

extension HomePresenter: HomePresenterProtocol {
	
}

extension HomePresenter: HomeInteractorOutputProtocol {
	
}
