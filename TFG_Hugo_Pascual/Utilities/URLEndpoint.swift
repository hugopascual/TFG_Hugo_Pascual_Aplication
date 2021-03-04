//
//  URLEndpoint.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation
import UIKit

struct URLEndpoint {
	
	public enum BaseURLContext {
		case local
		case heroku
	}
	
	static var none = ""
	
	// MARK: Users
	static var createUser = "users/registration"
	static var loginUser = "users/login"
}

extension URLEndpoint {
	
	static func getBaseUrl(urlContext: BaseURLContext) -> String {
		
		switch urlContext {
		case .local:
			return "http://localhost:5000/api"
		case .heroku:
			return "https://tfg-hugo-pascual-back.herokuapp.com/api"
		}
	}
}
