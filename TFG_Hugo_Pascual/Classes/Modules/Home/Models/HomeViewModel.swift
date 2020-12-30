//
//  HomeViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 30/12/2020.
//

import Foundation

class HomeViewModel: BaseViewModel {
	
	var title: String = "Sin titulo"
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
		
		guard let businessModel = businessModel as? HomeBusinessModel else { return }
		self.title = businessModel.title ?? "Sin titulo"
	}
	
	init(title: String) {
		super.init()
		self.title = title
	}
}
