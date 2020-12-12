//
//  ProfilePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfilePresenterProtocol: BasePresenterProtocol {
	func homeNavigationBarButtonPressed()
}

protocol ProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class ProfilePresenter: BasePresenter {
	
	weak var view: ProfileViewProtocol? { return super.baseView as? ProfileViewProtocol}
	var interactor: ProfileInteractorOutputProtocol? { return super.baseInteractor as? ProfileInteractorOutputProtocol}
	var router: ProfileRouterProtocol? { return super.baseRouter as? ProfileRouterProtocol}
	
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
	func homeNavigationBarButtonPressed() {
		router?.navigateToHome()
	}
	
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
	
}
