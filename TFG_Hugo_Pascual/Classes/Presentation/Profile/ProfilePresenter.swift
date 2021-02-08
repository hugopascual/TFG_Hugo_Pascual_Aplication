//
//  ProfilePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfilePresenterProtocol: BasePresenterProtocol {
	
}

protocol ProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {

}

class ProfilePresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: ProfileViewProtocol? { return super.baseView as? ProfileViewProtocol}
	var interactor: ProfileInteractorInputProtocol? { return super.baseInteractor as? ProfileInteractorInputProtocol}
	var router: ProfileRouterProtocol? { return super.baseRouter as? ProfileRouterProtocol}
	
	var viewModel = ProfileViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.view?.setViewModel(viewModel)
	}
}

extension ProfilePresenter: ProfilePresenterProtocol {

}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
	
}
