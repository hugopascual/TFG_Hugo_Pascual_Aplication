//
//  NibName.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

public enum NibName: String {

	// MARK: General Views
	case home = "HomeViewController"
	case customTabBarViewController = "CustomTabBarViewController"
	
	// MARK: Account Views
	case login = "LoginViewController"
	case myProfile = "MyProfileViewController"
	case registration = "RegistrationViewController"
	
	// MARK: Product Views
	case productsHome = "ProductsHomeViewController"
	case productList = "ProductsListViewController"
	case addProduct = "AddProductViewController"
	case productChooseCategory = "ProductChooseCategoryViewController"
	case productDetail = "ProductDetailViewController"
	
	// MARK: Custom Cells
	case productsHomeCategoryCell = "ProductsHomeCategoryCell"
	case productsListCell = "ProductsListCell"
}
