//
//  UserProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

// MARK: - Protocols
protocol UserProviderProtocol: BaseProviderProtocol {
	func getUsers(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping ([UserServerModel]?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
	func createUser(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class UserProvider: BaseProvider, UserProviderProtocol {
	
	// MARK: Functions
	func getUsers(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping ([UserServerModel]?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = UserProviderRequest.getUsers(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseArrayToServerModel(parserModel: [UserServerModel].self, data: data as? Data)
								success(serverModel)
		}, failure: { (error) in
			failure(error)
		})
	}
	
	// MARK: Functions
	func createUser(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping () -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = UserProviderRequest.createUser(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { _ in
			
								success()
							
		}, failure: { (error) in
			failure(error)
		})
	}
}

// MARK: - Structs
struct UserParamsDTO: BaseProviderParamsDTO {
	
	var email: String
	var username: String
	var password: String
}

struct UserProviderRequest {
	static func getUsers(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(), method: .get, urlContext: .heroku, endpoint: URLEndpoint.getAllUsers)
	}
	
	static func createUser(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(), method: .post, urlContext: .heroku, endpoint: URLEndpoint.createUser)
	}
}
