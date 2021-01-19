//
//  HomeViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 30/12/2020.
//

import Foundation

class HomeViewModel: BaseViewModel {
	
	//TODO añadir localización
	var title: String = "Home"
	var goToProfileButtonTitle: String = "Go to ProductDetail"
	var serviceButtonTitle: String = "Call To Service"
	var mainImage: String = ImagesNamesConstants.etsit_logo
	var text: String = "homeViewModelServiceText"
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
		
		guard let businessModel = businessModel as? HomeBusinessModel else { return }
		self.text = businessModel.text
	}
	
	override init() {
		super.init()
	}
}
