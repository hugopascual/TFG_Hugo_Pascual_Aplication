//
//  Presenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation

protocol xPresenterProtocol: BasePresenterProtocol {
	
}

protocol xInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class xPresenter: BasePresenter {
	
	weak var view: xViewProtocol? { return super.baseView as? xViewProtocol}
	var interactor: xInteractorOutputProtocol? { return super.baseInteractor as? xInteractorOutputProtocol}
	var router: xRouterProtocol? { return super.baseRouter as? xRouterProtocol}
	
}

extension xPresenter: xPresenterProtocol {
	
}

extension xPresenter: xInteractorOutputProtocol {
	
}
