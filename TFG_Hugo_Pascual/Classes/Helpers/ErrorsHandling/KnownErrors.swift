//
//  KnownErrors.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation

enum ViewError {
	case home
	
	case unspecified
}

public struct HTTPClientError: Error {
	
	var type: ErrorType = .unknownError
	
	enum ErrorType: Int {
		case internalServerError = 500
		case badGateway = 502
		case unauthorized = 401
		case forbidden = 403
		case notFound = 404
		case preConditionFailed = 412
		case requestError = 400
		case networkError = 0
		case unknownError = -1
	}
	
	init(code: Int) {
		self.type = ErrorType(rawValue: code) ?? .unknownError
	}
}

public struct BackendError: Error {
	
	var type: ErrorType = .unknownError
	var code: String = ""
	var serverMessage = ""
	
	enum ErrorType: String {
		
		case unknownError = ""
	}
	
	init(code: String, serverMessage: String) {
		
		self.type = ErrorType(rawValue: code) ?? .unknownError
		self.serverMessage = serverMessage
	}
}
