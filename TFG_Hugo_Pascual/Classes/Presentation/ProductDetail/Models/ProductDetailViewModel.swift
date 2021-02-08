//
//  ProductDetailViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation

class ProductDetailViewModel: BaseViewModel {
	
	//TODO añadir localización
	var screenTitle: String = "ProductDetail"
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
	}
	
	override init() {
		super.init()
	}
}
