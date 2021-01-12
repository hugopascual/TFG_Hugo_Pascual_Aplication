//
//  ProfileViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/01/2021.
//

import Foundation

class ProfileViewModel: BaseViewModel {
	
	//TODO añadir localización
	var title: String = "Profile"
	var serviceButtonTitle: String = "Call Service"
	var mainImage: String = ImagesNamesConstants.profile_logo
	var text: String = "profileViewModelServiceText"
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
		
		guard let businessModel = businessModel as? ProfileBusinessModel else { return }
		self.text = businessModel.text
	}
	
	override init() {
		super.init()
	}
}
