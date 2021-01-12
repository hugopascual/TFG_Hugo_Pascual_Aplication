//
//  ProfileBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/01/2021.
//

import Foundation

class ProfileBusinessModel: BaseBusinessModel {
	
	var text: String = "ProfileBusinessModelText"
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		guard let serverModel = serverModel as? ProfileServerModel else { return }
		
		self.text = serverModel.text
	}
	
	override init() { super.init() }
}
