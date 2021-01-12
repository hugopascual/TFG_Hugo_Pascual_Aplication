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
	weak var baseView: BaseViewProtocol?
	var baseRouter: BaseRouterProtocol?
	var baseInteractor: BaseInteractorInputProtocol?
	
	required init() {
		
	}

	// MARK: BaseInteractorOutputProtocol
	func genericErrorHappened(error: CustomErrorModel) {
		
	}
}

extension BasePresenter: BaseRouterDelegate {

	func navigationDone() {
		// Do something every time a navigation is done
		// If you cannot, for example, an invalid credentials error is displayed
	}
}
