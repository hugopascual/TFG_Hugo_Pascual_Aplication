//
//  ProfileProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

// MARK: - Protocols
protocol ProfileProviderProtocol: BaseProviderProtocol {

}

// MARK: - Class
class ProfileProvider: BaseProvider, ProfileProviderProtocol {

}

// MARK: - Structs

struct ProfileDTO: BaseProviderParamsDTO {
	
}

struct ProfileProviderRequest {
	static func getProfile(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
						   method: .get,
						   urlContext: .local,
						   endpoint: URLEndpoint.none)
	}
}
