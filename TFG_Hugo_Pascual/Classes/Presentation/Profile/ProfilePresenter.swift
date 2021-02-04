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
		self.getProfile()
	}
	
	func setInteractorData(businessModel: ProfileBusinessModel) {
		self.view?.setServiceData(businessModel: businessModel)
	}
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
	func getProfile() {
		self.interactor?.getProfile()
	}
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
	
	func didGetProfileInfo(businessModel: ProfileBusinessModel) {
		self.setInteractorData(businessModel: businessModel)
	}
	
	func didNotGetProfileInfo() {
		
	}
}
