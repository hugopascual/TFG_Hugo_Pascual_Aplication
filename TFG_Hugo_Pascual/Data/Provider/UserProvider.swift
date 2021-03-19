//
//  UserProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

// MARK: - Protocols
protocol UserProviderProtocol: BaseProviderProtocol {
	func registerUser(dto: UserParamsDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
	func loginUser(dto: UserParamsDTO, success: @escaping (UserServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class UserProvider: BaseProvider, UserProviderProtocol {
	
	// MARK: Functions
	func registerUser(dto: UserParamsDTO, success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = UserProviderRequest.createUser(params: dto)
		
		self.genericRequest(dto: providerDTO,
							success: { _ in
								
								success()
								
							}, failure: { (error) in
								failure(error)
							})
	}
	
	func loginUser(dto: UserParamsDTO, success: @escaping (UserServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = UserProviderRequest.loginUser(params: dto)
		
		_ = self.request(dto: providerDTO,
						 success: { data in
							
							let serverModel = BaseProvider.parseToServerModel(parserModel: UserServerModel.self, data: data)
							success(serverModel)
							
						 }, failure: { (error) in
							failure(error)
						})
	}
}

// MARK: - Structs
struct UserParamsDTO: BaseProviderParamsDTO {
	
	var email: String
	var username: String?
	var password: String
}

struct UserProviderRequest {
	
	static func createUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .post,
						   urlContext: .backend,
						   endpoint: URLEndpoint.registerUser)
	}
	
	static func loginUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .post,
						   urlContext: .backend,
						   endpoint: URLEndpoint.loginUser)
	}
}
