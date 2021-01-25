//
//  ProfileProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

// MARK: - Protocols
protocol ProfileProviderProtocol: BaseProviderProtocol {
	func getProfile(dto: ProfileDTO, additionalHeaders: [String: String], success: @escaping (ProfileServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class ProfileProvider: BaseProvider, ProfileProviderProtocol {
	
	// MARK: Functions
	func getProfile(dto: ProfileDTO, additionalHeaders: [String: String], success: @escaping (ProfileServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = ProfileProviderRequest.getProfile(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseToServerModel(parserModel: ProfileServerModel.self, data: data as? Data)
								success(serverModel)
		}, failure: { (error) in
			failure(error)
		})
	}
}

// MARK: - Structs
struct ProfileDTO: BaseProviderParamsDTO {
	
}

struct ProfileProviderRequest {
	static func getProfile(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .heroku,
						   endpoint: URLEndpoint.profile)
	}
}
