//
//  ToastViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/06/2021.
//

import Foundation

class ToastViewModel: BaseViewModel {
	
	enum ViewType {
		case info
		case success
		case error
		case infoClose
	}
	
	var type: ViewType?
	var title: String?
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
	}
	
	init(type: ViewType?, title: String?) {
		super.init()
		self.type = type
		self.title = title
	}
}
