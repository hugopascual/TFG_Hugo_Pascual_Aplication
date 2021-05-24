//  
//  RegistrationViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

final class RegistrationViewModel: BaseViewModel {

	var screenTitle: String = LocalizedKeys.Registration.registration
	
	var emailPlaceholder: String = LocalizedKeys.Common.email
	var usernamePlaceholder: String = LocalizedKeys.Common.username
	var passworPlaceholder: String = LocalizedKeys.Common.password
}
