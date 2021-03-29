//
//  DataAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

struct DataAssembly {
	
	// MARK: Registration Provider
	static func registerProvider(interactor: BaseInteractor) -> RegisterProviderProtocol {
		let provider = RegisterProvider()
		provider.delegate = interactor
		return provider
	}
	
	// MARK: Login Provider
	static func loginProvider(interactor: BaseInteractor) -> LoginProviderProtocol {
		let provider = LoginProvider()
		provider.delegate = interactor
		return provider
	}
	
	// MARK: Chek Session Provider
	static func checkSessionProvider(interactor: BaseInteractor) -> CheckSessionProviderProtocol {
		let provider = CheckSessionProvider()
		provider.delegate = interactor
		return provider
	}
}
