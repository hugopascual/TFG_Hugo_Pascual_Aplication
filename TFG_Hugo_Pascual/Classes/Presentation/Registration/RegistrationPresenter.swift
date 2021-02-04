//
//  RegistrationPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

protocol RegistrationPresenterProtocol:BasePresenterProtocol {
	
}

protocol RegistrationInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class RegistrationPresenter: BasePresenter {
	
	weak var view: RegistrationViewControllerProtocol? { return super.baseView as? RegistrationViewControllerProtocol }
	var interactor: RegistrationInteractorInputProtocol? { return super.baseRouter as? RegistrationInteractorInputProtocol }
	var router: RegistrationRouterProtocol? { return super.baseRouter as? RegistrationRouterProtocol }
	
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
	
}

extension RegistrationPresenter: RegistrationInteractorOutputProtocol {
	
}
