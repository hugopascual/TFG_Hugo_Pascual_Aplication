//
//  UserBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

class UserBusinessModel: BaseBusinessModel {
	
	override init() { super.init() }
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		guard let serverModel = serverModel as? UserServerModel else { return }
		
	}
}
