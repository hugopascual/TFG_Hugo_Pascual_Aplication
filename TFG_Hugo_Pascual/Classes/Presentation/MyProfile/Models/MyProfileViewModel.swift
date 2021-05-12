//
//  MyProfileViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/01/2021.
//

import Foundation

class MyProfileViewModel: BaseViewModel {
	
	//TODO añadir localización
	var screenTitle: String = LocalizedKeys.MyProfile.profile
	
	var mainImage: String = ImagesNamesConstants.profile_logo
	var logoutButtonTitle: String = LocalizedKeys.MyProfile.logout
	var myProductsButtonTitle: String = LocalizedKeys.MyProfile.my_products_button_title
}
