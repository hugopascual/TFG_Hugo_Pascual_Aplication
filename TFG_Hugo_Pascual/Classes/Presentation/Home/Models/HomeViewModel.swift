//
//  HomeViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 30/12/2020.
//

import Foundation

class HomeViewModel: BaseViewModel {
	
	//TODO añadir localización
	var screenTitle: String = "Home"
	var goToProfileButtonTitle: String = "Detalle Producto"
	var mainImage: String = ImagesNamesConstants.etsit_logo
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
	}
	
	override init() {
		super.init()
	}
}
