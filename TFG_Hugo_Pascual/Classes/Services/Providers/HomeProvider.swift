//
//  HomeProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

// MARK: - Protocols
protocol HomeProviderProtocol: BaseProviderProtocol {
	func getHome(dto: HomeDTO, additionalHeaders: [String: String], success: @escaping (HomeServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void)
}

// MARK: - Class
class HomeProvider: BaseProvider, HomeProviderProtocol {

	// MARK: Functions
	func getHome(dto: HomeDTO, additionalHeaders: [String: String], success: @escaping (HomeServerModel?) -> Void, failure: @escaping (CustomErrorModel) -> Void) {
		let providerDTO = HomeProviderRequest.getHomeConstants(params: dto)
		
		self.genericRequest(dto: providerDTO,
						 success: { (data) in
								let serverModel = BaseProvider.parseToServerModel(parserModel: HomeServerModel.self, data: data as? Data)
								success(serverModel)
		}, failure: { (error) in
			failure(error)
		})
	}
	
}

// MARK: - Structs
struct HomeDTO: BaseProviderParamsDTO {
	
}

struct HomeProviderRequest {
	static func getHomeConstants(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .heroku,
						   endpoint: URLEndpoint.home)
	}
}
