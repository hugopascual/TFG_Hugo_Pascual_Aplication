//  
//  LoginViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 13/02/2021.
//

import Foundation

final class LoginViewModel: BaseViewModel {

	var screenTitle: String = LocalizedKeys.Login.login
	
	var emailPlaceholder: String = LocalizedKeys.Common.email
	var passworPlaceholder: String = LocalizedKeys.Common.password
	
	var loginButtonTitle: String = LocalizedKeys.Login.login
	var registrationButtonTittle: String = LocalizedKeys.Login.no_account
	
	var loginErrorMessage: String = LocalizedKeys.Common.error_message
}
