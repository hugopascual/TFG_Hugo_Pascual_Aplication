//
//  ProfileViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/01/2021.
//

import Foundation

class ProfileViewModel: BaseViewModel {
	
	//TODO añadir localización
	var screenTitle: String = "Profile"
	var mainImage: String = ImagesNamesConstants.profile_logo
	
	required init(businessModel: BaseBusinessModel?) {
		super.init(businessModel: businessModel)
	}
	
	override init() {
		super.init()
	}
}
