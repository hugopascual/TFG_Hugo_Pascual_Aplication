//
//  AddProductViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation

class AddProductViewModel: BaseViewModel {
	
	//TODO añadir localización
	var title: String = "AddProduct"
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
	}
	
	override init() {
		super.init()
	}
}
