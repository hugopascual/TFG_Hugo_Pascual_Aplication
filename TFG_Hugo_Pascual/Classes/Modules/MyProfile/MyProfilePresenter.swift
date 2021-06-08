//
//  MyProfilePresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol MyProfilePresenterProtocol: BasePresenterProtocol {
	func myProductsButtonPressed()
	func logoutButtonPressed()
}

protocol MyProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func logoutSucess()
	func logoutFailure()
}

class MyProfilePresenter: BasePresenter {
	
	// MARK: VIPER Dependencies
	weak var view: MyProfileViewProtocol? { return super.baseView as? MyProfileViewProtocol}
	var interactor: MyProfileInteractorInputProtocol? { return super.baseInteractor as? MyProfileInteractorInputProtocol}
	var router: MyProfileRouterProtocol? { return super.baseRouter as? MyProfileRouterProtocol}
	
	var viewModel = MyProfileViewModel()
	
	// MARK: Private Functions
	func viewDidLoad() {
		self.viewModel.screenTitle = self.viewModel.screenTitle.replacingOccurrences(of: "%@", with: "\(DataPersisterHelper.standard.localUserData.username)")
		self.view?.setViewModel(viewModel)
	}
}

extension MyProfilePresenter: MyProfilePresenterProtocol {

	func myProductsButtonPressed() {
		self.router?.navigateToProductsUserList()
	}
	
	func logoutButtonPressed() {
		self.interactor?.logout()
	}
}

extension MyProfilePresenter: MyProfileInteractorOutputProtocol {
	
	func logoutSucess() {
		self.router?.navigateToHome()
	}
	
	func logoutFailure() {
		self.router?.navigateToHome()
	}
}
