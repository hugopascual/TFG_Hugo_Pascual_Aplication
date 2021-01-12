//
//  HomeBusinessModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 28/12/2020.
//

import Foundation

class HomeBusinessModel: BaseBusinessModel {
	
	var text: String = "home businessModel title"
	
	required init(serverModel: BaseServerModel?) {
		super.init(serverModel: serverModel)
		
		guard let serverModel = serverModel as? HomeServerModel else { return }
		
		self.text = serverModel.text
	}
	
	override init() { super.init() }
}
