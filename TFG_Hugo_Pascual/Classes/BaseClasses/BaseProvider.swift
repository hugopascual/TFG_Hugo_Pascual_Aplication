//
//  BaseProvider.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import UIKit

struct ProviderDTO {
	var params: [String: Any]?
//	var arrayParams: [[String: Any]]?
//	var method: HTTPMethod
//	var urlContext: URLEndpoint.BaseURLContext
	var endpoint: String
//	var acceptType = AcceptResponseType.json
//
//	init(params: [String: Any]?,
//		 method: HTTPMethod,
//		 urlContext: URLEndpoint.BaseURLContext,
//		 endpoint: String,
//		 acceptType: AcceptResponseType = .json) {
//
//		self.params = params
//		self.method = method
//		self.urlContext = urlContext
//		self.endpoint = endpoint
//		self.acceptType = acceptType
//	}
//
//	init(arrayParams: [[String: Any]]?,
//		 method: HTTPMethod,
//		 endpoint: String,
//		 urlContext: URLEndpoint.BaseURLContext,
//		 acceptType: AcceptResponseType = .json) {
//
//		self.arrayParams = arrayParams
//		self.method = method
//		self.urlContext = urlContext
//		self.endpoint = endpoint
//		self.acceptType = acceptType
//	}
}

class BaseProvider {
	
	weak var delegate: BaseProviderDelegate?
	
}
