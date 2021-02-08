//  
//  RegistrationPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/02/2021.
//

import Foundation

protocol RegistrationPresenterProtocol: BasePresenterProtocol {
	
}

protocol RegistrationInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class RegistrationPresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: RegistrationViewControllerProtocol? { return super.baseView as? RegistrationViewControllerProtocol }
	var router: RegistrationRouterProtocol? { return super.baseRouter as? RegistrationRouterProtocol }
	var interactor: RegistrationInteractorInputProtocol? { return super.baseInteractor as? RegistrationInteractorInputProtocol }
	
	var viewModel = RegistrationViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(viewModel)
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension RegistrationPresenter: RegistrationPresenterProtocol {
	
}

extension RegistrationPresenter: RegistrationInteractorOutputProtocol {
	
}
