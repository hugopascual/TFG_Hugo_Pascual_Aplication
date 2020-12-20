//
//  ErrorLoginBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/12/2020.
//

import Foundation

class ErrorLoginBusinessModel: BaseBusinessModel {
	
	var code: String?
	var description: String?
	var userToken: String?
	var email: String?
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		guard let serverModel = serverModel as? ErrorLoginServerModel else { return }
		self.code = serverModel.code
		self.description = serverModel.description
		self.userToken = serverModel.userToken
		self.email = serverModel.email
	}
}
