//
//  LoginProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

// MARK: - Protocols
protocol LoginProviderProtocol: BaseProviderProtocol {
	func loginUser(dto: LoginUserDTO, success: @escaping (UserServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
	func logoutUser(dto: LogoutUserDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class LoginProvider: BaseProvider, LoginProviderProtocol {
	
	// MARK: Functions
	func loginUser(dto: LoginUserDTO, success: @escaping (UserServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = LoginProviderRequest.loginUser(params: dto.params)
		
		_ = self.request(dto: providerDTO,
						 success: { data in
							
							let serverModel = BaseProvider.parseToServerModel(parserModel: UserServerModel.self, data: data)
							success(serverModel)
							
						 }, failure: { (error) in
							failure(error)
						})
	}
	
	func logoutUser(dto: LogoutUserDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = LoginProviderRequest.logoutUser(params: dto.params)
		
		_ = self.request(dto: providerDTO,
						 success: { _ in
							success()
						 }, failure: { (error) in
							failure(error)
						})
	}
}

// MARK: - Structs
struct LoginUserDTO {

	var params: Params?
	
	struct Params: BaseProviderParamsDTO {
		var email: String?
		var password: String?
	}
}

struct LogoutUserDTO {
	
	var params: Params?
	
	struct Params: BaseProviderParamsDTO {
		var token: String?
	}
}

struct LoginProviderRequest {

	static func loginUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .post,
						   urlContext: .backend,
						   endpoint: URLEndpoint.loginUser)
	}
	
	static func logoutUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .delete,
						   urlContext: .backend,
						   endpoint: URLEndpoint.logoutUser)
	}
}
