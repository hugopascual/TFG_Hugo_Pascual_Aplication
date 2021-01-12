//
//  CustomErrorModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation

class CustomErrorModel: NSError {
	
	var type: String = "Backend"
	var internalCode: String = ""
	var originalObject: Any?
	var httpClientError = HTTPClientError(code: -1)
	var backendError = BackendError(code: "", serverMessage: "")
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	init(httpClientError: HTTPClientError.ErrorType, backendError: BackendError.ErrorType) {

		self.httpClientError = HTTPClientError(code: httpClientError.rawValue)
		self.backendError = BackendError(code: backendError.rawValue, serverMessage: "")
		let defaultDomain = "error_generic_description"// TODO añadir la localización
		
		super.init(domain: defaultDomain, code: self.httpClientError.type.rawValue, userInfo: nil)

	}
	
	init(data: Data?, httpCode: Int?) {
		
		self.httpClientError = HTTPClientError(code: httpCode ?? -1)
		
		let defaultDomain = "error_generic_description"// TODO añadir la localización
		let defaultCode = self.httpClientError.type.rawValue
		
		guard let data = data else {
			super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
			return
		}
		if  let errorLoginModelModel = try? JSONDecoder().decode(ErrorLoginServerModel.self, from: data) {
			
			let errorLoginModel = ErrorLoginBusinessModel(serverModel: errorLoginModelModel)
			let domain = errorLoginModel.description ?? defaultDomain
			super.init(domain: domain,
					   code: defaultCode,
					   userInfo: nil)
			self.originalObject = errorLoginModel
			self.internalCode = errorLoginModel.code ?? ""
			
			self.backendError = BackendError(code: errorLoginModel.code ?? "", serverMessage: errorLoginModel.description ?? "")
			
			return
		}
		super.init(domain: defaultDomain, code: defaultCode, userInfo: nil)
	}
}
