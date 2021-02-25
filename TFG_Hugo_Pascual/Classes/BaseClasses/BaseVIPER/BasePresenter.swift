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
	
	// MARK: Logout, creo que no sirve para nada
	static func logout() {
		
//        BaseInteractor.removeDataForLogout()
//        BaseRouter.logout()
	}
	
	// MARK: Alerts
//	func showAlert(error: CustomErrorViewModel) {
//		self.baseView?.showAlertWith(title: "Error".localized, message: error.textDescription, actions: nil)
//	}
	
	func showNetworkErrorAlert() {
//		self.baseView?.showNetworkAlert()
	}
	
	// MARK: Errors
	func showError(error: CustomErrorModel) {
//		switch error.backendError.type {
//		case .invalidToken:
//
//			self.invalidCredentialsError()
//
//		default:
//			let errorViewModel = CustomErrorViewModel(model: error)
//			self.showCustomError(error: errorViewModel)
//		}
	}
	
//	func showCustomError(error: CustomErrorViewModel) {
//		self.baseView?.showError(error: error)
//	}
	
	func invalidCredentialsError() {
		
//		let action = CustomAlertAction(title: "Aceptar".localized) { _ in
//			BasePresenter.logout()
//		}
//
//		self.baseView?.showAlertWith(title: "Error".localized, message: "Logut".localized, actions: [action])
	}

	func autologinErrorHappened(loginSuccess: @escaping (() -> Void), tabBarFunctionality: Bool) {
		
		var loginClosed: (() -> Void)?
		
		if tabBarFunctionality {
			loginClosed = {
				self.baseRouter?.changeTabInCustomTabBar(tab: .home)
			}
		}
		
//		let userLoginState = self.baseInteractor?.getUserLoginState() ?? .noLogged
//
//		self.baseRouter?.navigateToLogin(dto: LoginAssemblyDTO(isSessionReminded: userLoginState == .reminded, loginSuccess: loginSuccess, loginClosed: loginClosed))
	}
	
	func pushTokenChanged(pushToken: String) {
//		self.baseInteractor?.activateNotificationsInGnomo(pushToken: pushToken)
	}
	
	// MARK: NetworkAlertViewDelegate
//	func buttonRetryPressed(_ networkAlertView: NetworkAlertView) {}
//	func buttonClosePressed(_ networkAlertView: NetworkAlertView) {}
	
	// MARK: BaseInteractorOutputProtocol
	func genericErrorHappened(error: CustomErrorModel) {
		self.showError(error: error)
	}
	
	func asyncTaskStarted() {
//		self.baseView?.showLoading(fullScreen: true)
	}
	
	func asyncTaskFinished() {
//		self.baseView?.hideLoading()
	}
	
	func networkErrorHappened() {
		self.showNetworkErrorAlert()
	}
}

extension BasePresenter: BaseRouterDelegate {

	func navigationDone() {
		// Do something every time a navigation is done
		// If you cannot, for example, an invalid credentials error is displayed
	}
}
