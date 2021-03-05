//
//  Enums.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

public enum XibFile: String {

	// MARK: General Views
	case home = "HomeViewController"
	case customTabBarViewController = "CustomTabBarViewController"
	
	// MARK: Account Views
	case login = "LoginViewController"
	case myProfile = "MyProfileViewController"
	case registration = "RegistrationViewController"
	
	// MARK: Aux Views
	case productList = "ProductListViewController"
}

enum UserLoginState {
	case logged
	case noLogged
}
