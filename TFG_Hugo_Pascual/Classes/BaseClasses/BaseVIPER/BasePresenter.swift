//
//  BasePresenter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation

class BasePresenter {
	
	internal weak var baseView: BaseViewProtocol?
	internal var baseRouter: BaseRouterProtocol?
	internal var baseInteractor: BaseInteractorInputProtocol?
	
	required init() {}
	
	// MARK: BaseInteractorOutputProtocol
	func genericErrorHappened(error: CustomErrorModel) {
		print("ERROR")
		//self.showError(error: error)
	}
	
}

extension BasePresenter: BaseRouterDelegate {

	func navigationDone() {
		
		// Do something every time a navigation is done
		// If you cannot, for example, an invalid credentials error is displayed
		//            BasePresenter.invalidCredentialsError()
	}
}
