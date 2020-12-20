//
//  HomeProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

// MARK: - Protocols
protocol HomeProviderProtocol: BaseProviderProtocol {

}

// MARK: - Class
class HomeProvider: BaseProvider, HomeProviderProtocol {

}

// MARK: - Structs

struct HomeDTO: BaseProviderParamsDTO {
	
}

struct HomeProviderRequest {
	static func getHomeConstants(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .local,
						   endpoint: URLEndpoint.home)
	}
}
