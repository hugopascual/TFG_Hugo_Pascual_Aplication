//
//  Interactor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation

protocol xInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class xInteractor: BaseInteractor {
	
	weak var presenter: xInteractorOutputProtocol? { return super.basePresenter as? xInteractorOutputProtocol }
	var provider: xProviderProtocol?
	
}

extension xInteractor: xInteractorInputProtocol {
	
}
