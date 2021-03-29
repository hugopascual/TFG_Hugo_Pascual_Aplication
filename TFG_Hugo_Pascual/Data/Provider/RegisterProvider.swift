//
//  RegisterProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/03/2021.
//

import Foundation

// MARK: - Protocols
protocol RegisterProviderProtocol: BaseProviderProtocol {
	func registerUser(dto: RegisterUserDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class RegisterProvider: BaseProvider, RegisterProviderProtocol {
	
	// MARK: Functions
	func registerUser(dto: RegisterUserDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = RegisterProviderRequest.registerUser(params: dto.params)
		
		self.genericRequest(dto: providerDTO,
							success: { _ in
								
								success()
								
							}, failure: { (error) in
								failure(error)
							})
	}
}

// MARK: - Structs
struct RegisterUserDTO {
	
	var params: Params?
	
	struct Params: BaseProviderParamsDTO {
		var email: String?
		var username: String?
		var password: String?
	}
}

struct RegisterProviderRequest {
	
	static func registerUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .post,
						   urlContext: .backend,
						   endpoint: URLEndpoint.registerUser)
	}
}
