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
		case local
	}
	
	static var none = ""
	
	// MARK: Users
	static var loginUser = "login"
	static var logoutUser = "logout"
	static var registerUser = "users/registration"
	
	// MARK: Products
	static var addProduct = "products/add"
	static var getProductList = "products/getList"
	static var getProductDetail = "products/getDetail"
	static var getProductsUserList = "products/getUserLists"
	static var deleteProduct = "products/delete"
}

extension URLEndpoint {
	
	static func getBaseUrl(urlContext: BaseURLContext) -> String {
		
		switch urlContext {
		case .backend:
			return "https://tfg-hugo-pascual-back.herokuapp.com/api"
		case .local:
			return "http://localhost:5000/api"
		}
	}
}
