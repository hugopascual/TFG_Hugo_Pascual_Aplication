//
//  HomeInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class HomeInteractor: BaseInteractor {
	
	weak var presenter: HomeInteractorOutputProtocol? { return super.basePresenter as? HomeInteractorOutputProtocol }
	var provider: HomeProviderProtocol?
	
}

extension HomeInteractor: HomeInteractorInputProtocol {
	
}
