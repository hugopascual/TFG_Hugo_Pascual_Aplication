//
//  DataAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

struct DataAssembly {
	
	// MARK: Home Provider
	static func homeProvider(interactor: BaseInteractor) -> HomeProviderProtocol {
		let provider = HomeProvider()
		provider.delegate = interactor as? BaseProviderDelegate
		return provider
	}
	
	// MARK: Profile Provider
	static func profileProvider(interactor: BaseInteractor) -> ProfileProviderProtocol {
		let provider = ProfileProvider()
		provider.delegate = interactor as? BaseProviderDelegate
		return provider
	}
}
