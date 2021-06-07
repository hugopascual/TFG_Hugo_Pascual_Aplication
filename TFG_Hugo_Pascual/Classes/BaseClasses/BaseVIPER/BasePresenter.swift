//
//  BasePresenter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//
import UIKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BasePresenter {
	
	// Declared weak for the ARC to destroy them.
	weak var baseView: BaseViewControllerProtocol?
	var baseRouter: BaseRouterProtocol?
	var baseInteractor: BaseInteractorInputProtocol?
	
	required init() {}

	func autologinErrorHappened(loginSuccess: @escaping (() -> Void), tabBarFunctionality: Bool) {
		
		var loginClosed: (() -> Void)?
		
		if tabBarFunctionality {
			loginClosed = {
				self.baseRouter?.changeTabInCustomTabBar(tab: .home)
			}
		}
		
		self.baseRouter?.navigateToLogin(dto: LoginAssemblyDTO(loginSuccess: loginSuccess, loginClosed: loginClosed))
	}
	
	func showError(error: CustomErrorModel) {
		self.baseView?.showError(error: error)
	}
	
	// MARK: BaseInteractorOutputProtocol
	func genericErrorHappened(error: CustomErrorModel) {
		self.showError(error: error)
	}
	
	func asyncTaskStarted() {
		self.baseView?.showLoading(fullScreen: true)
	}
	
	func asyncTaskFinished() {
		self.baseView?.hideLoading()
	}
	
	func networkErrorHappened() {

	}
}

extension BasePresenter: BaseRouterDelegate {

	func navigationDone() {
		// Do something every time a navigation is done
		// If you cannot, for example, an invalid credentials error is displayed
	}
}
