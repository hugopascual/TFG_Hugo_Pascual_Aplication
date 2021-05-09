//
//  UserBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

class UserBusinessModel: BaseBusinessModel {
	
	var email: String?
	var username: String?
	var token: String?
	var id: String?
	
	override init() { super.init() }
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		guard let serverModel = serverModel as? UserServerModel else { return }
		
		self.email = serverModel.email
		self.id = serverModel.id
		self.username = serverModel.username
		self.token = serverModel.token
	}
	
	internal init(email: String? = nil, username: String? = nil, token: String? = nil, id: String? = nil) {
		super.init()
		
		self.email = email
		self.username = username
		self.token = token
		self.id = id
	}
}
