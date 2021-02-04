//
//  UserProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

// MARK: - Protocols
protocol UserProviderProtocol: BaseProviderProtocol {
	func getUsers(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping (ProfileServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class UserProvider: BaseProvider, UserProviderProtocol {
	
	// MARK: Functions
	func getUsers(dto: UserParamsDTO, additionalHeaders: [String: String], success: @escaping (ProfileServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = UserProviderRequest.getUsers(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseArrayToServerModel(parserModel: ProfileServerModel.self, data: data as? Data)
								success(serverModel)
		}, failure: { (error) in
			failure(error)
		})
	}
}

// MARK: - Structs
struct UserParamsDTO: BaseProviderParamsDTO {
	
}

struct UserProviderRequest {
	static func getUsers(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(), method: .get, urlContext: .heroku, endpoint: URLEndpoint.profile)
	}
}
