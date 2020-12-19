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
	
	static var none = "none"
	static var login = "login"
	static var home = "getHome"
	
}

extension URLEndpoint {
	
	static func getBaseUrl(urlContext: BaseURLContext) -> String {
		
		switch urlContext {
		case .local:
			return "http://localhost:3000"
		case .heroku:
			return "https://TFG_Hugo_Pascual_Back.herokuapp.com"
		}
	}
	
	static func getVersion(urlContext: BaseURLContext) -> String {
		
		switch urlContext {
		case .local:
			return "v1"
		case .heroku:
			return "v1"
		}
	}
}

struct URLPaymentGateway {
	
	static let baseUrlPSP = "https://sc-icpdzpre.correos.es"
	
	static var postPspActionCorreos = "\(baseUrlPSP)/ilionx45Front/Custom/SCICPInterfaz/SCICPInterfaz.aspx"
}
