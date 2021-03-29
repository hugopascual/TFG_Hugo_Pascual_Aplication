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
		case backend
	}
	
	static var none = ""
	
	// MARK: Users
	static var loginUser = "login"
	static var logoutUser = "logout"
	static var registerUser = "users/registration"
}

extension URLEndpoint {
	
	static func getBaseUrl(urlContext: BaseURLContext) -> String {
		
		switch urlContext {
		case .backend:
			return "http://localhost:5000/api"
//			return "https://tfg-hugo-pascual-back.herokuapp.com/api"
		}
	}
}
