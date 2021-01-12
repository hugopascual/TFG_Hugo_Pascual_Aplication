//
//  ProfilePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfilePresenterProtocol: BasePresenterProtocol {
	func getProfile()
}

protocol ProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func didGetProfileInfo(businessModel: ProfileBusinessModel)
	func didNotGetProfileInfo()
}

class ProfilePresenter: BasePresenter {
	
	weak var view: ProfileViewProtocol? { return super.baseView as? ProfileViewProtocol}
	var interactor: ProfileInteractorInputProtocol? { return super.baseInteractor as? ProfileInteractorInputProtocol}
	var router: ProfileRouterProtocol? { return super.baseRouter as? ProfileRouterProtocol}
	
	var viewModel = ProfileViewModel()
	
	func viewDidLoad() {
		self.view?.setViewModel(viewModel)
		self.view?.setNavigationBar(title: viewModel.title)
		self.getProfile()
	}
	
	func configureAndSetViewModel(businessModel: ProfileBusinessModel) {
		self.viewModel = ProfileViewModel(businessModel: businessModel)
		self.view?.setViewModel(viewModel)
	}
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
	func getProfile() {
		self.interactor?.getProfile()
	}
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
	
	func didGetProfileInfo(businessModel: ProfileBusinessModel) {
		self.configureAndSetViewModel(businessModel: businessModel)
	}
	
	func didNotGetProfileInfo() {
		self.configureAndSetViewModel(businessModel: ProfileBusinessModel())
	}
}
