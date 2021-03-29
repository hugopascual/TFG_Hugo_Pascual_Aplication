//
//  CheckSessionProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/03/2021.
//

import Foundation

// MARK: - Protocols
protocol CheckSessionProviderProtocol: BaseProviderProtocol {
	func checkSessionExpires(success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class CheckSessionProvider: BaseProvider, CheckSessionProviderProtocol {
	
	// MARK: Functions
	func checkSessionExpires(success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = CheckSessionProviderRequest.checkSession()
		
		_ = self.request(dto: providerDTO,
						 success: { _ in
							success()
						 }, failure: { (error) in
							failure(error)
						})
	}
}

// MARK: - Structs

struct CheckSessionProviderRequest {
	
	static func checkSession() -> ProviderDTO {
		return ProviderDTO(params: nil,
						   method: .get,
						   urlContext: .backend,
						   endpoint: URLEndpoint.loginUser)
	}
}
