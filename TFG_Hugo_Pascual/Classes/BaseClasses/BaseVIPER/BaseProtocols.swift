//
//  BaseProtocols.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

// Protocol used to the Presenter can communicate with View
protocol BaseViewControllerProtocol: class {
	func setViewModel(_ viewModel: Any)
	func showLoading(fullScreen: Bool)
	func hideLoading()
}

extension BaseViewControllerProtocol {
	func setViewModel(_ viewModel: Any) {}
}

// Protocol used to the View can communicate with Presenter
protocol BasePresenterProtocol: class {
	func viewDidLoad()
	func viewWillAppear(isFirstPresentation: Bool)
	func viewDidAppear(isFirstPresentation: Bool)
	func viewWillDisappear()
}

extension BasePresenterProtocol {
	func viewDidLoad() {}
	func viewWillAppear(isFirstPresentation: Bool) {}
	func viewDidAppear(isFirstPresentation: Bool) {}
	func viewWillDisappear() {}
}

// Protocol used to the Presenter can communicate with Interactor
protocol BaseInteractorInputProtocol: class {
	func getUserLoginState() -> UserLoginState
}

// Protocol used to the Interactor can communicate with Presenter
protocol BaseInteractorOutputProtocol: class {
	func genericErrorHappened(error: CustomErrorModel) //Method used to notify Presenter that error has happened
	func asyncTaskStarted()
	func asyncTaskFinished()
	func networkErrorHappened()
	func autologinErrorHappened(loginSuccess: @escaping (() -> Void), tabBarFunctionality: Bool)
}

extension BaseInteractorOutputProtocol {
	func genericErrorHappened(error: CustomErrorModel) {}
	func asyncTaskStarted() {}
	func asyncTaskFinished() {}
	func networkErrorHappened() {}
	func autologinErrorHappened(loginSuccess: @escaping (() -> Void), tabBarFunctionality: Bool) {}
}

// Protocol used to the Presenter can communicate with Router
protocol BaseRouterProtocol: class {
	func navigateToLogin(dto: LoginAssemblyDTO?)
	func changeTabInCustomTabBar(tab: Tab)
}

// Delegate used to report that a navigation has been done. It will usually be implemented by the Presenter
protocol BaseRouterDelegate: class {
	func navigationDone()
}

// Delegate used to report actions with web services. It will usually be implemented by the Interactor
protocol BaseProviderDelegate: class {
	func requestDone(endpoint: String)
	func responseGet(endpoint: String)
	func networkNotReachable(endpoint: String)
}

protocol BaseProviderProtocol: class {
	func genericRequest(dto: ProviderDTO, success: @escaping (Any?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

extension BaseProviderProtocol {
	func genericRequest(dto: ProviderDTO, success: @escaping (Any?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {}
}
