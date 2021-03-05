//
//  DataAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

struct DataAssembly {
	
	// MARK: User Provider
	static func userProvider(interactor: BaseInteractor) -> UserProviderProtocol {
		let provider = UserProvider()
		provider.delegate = interactor
		return provider
	}
}
