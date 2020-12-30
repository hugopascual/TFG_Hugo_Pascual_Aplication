//
//  BaseProtocols.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation

protocol BaseViewProtocol: class {
	
}

protocol BasePresenterProtocol: class {
	
}

protocol BaseInteractorInputProtocol: class {
	
}

protocol BaseInteractorOutputProtocol: class {
	func genericErrorHappened(error: CustomErrorModel) //Method used to notify Presenter that error has happened
}

// Protocol used to the Presenter can communicate with Router
protocol BaseRouterProtocol: class {
	
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

}
