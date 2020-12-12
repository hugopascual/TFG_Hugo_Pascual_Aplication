//
//  Provider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation

// MARK: - Protocols
protocol xProviderProtocol: BaseProviderProtocol {

}

// MARK: - Class
class xProvider: BaseProvider, xProviderProtocol {

}

// MARK: - Structs

struct xDTO: BaseProviderParamsDTO {
	
}

struct xProviderRequest {
	static func getX(params: BaseProviderParamsDTO?) -> ProviderDTO {
		return ProviderDTO(params: params?.encode(),
//						   method: .get,
//						   urlContext: .backend,
						   endpoint: URLEndpoint.none)
	}
}
