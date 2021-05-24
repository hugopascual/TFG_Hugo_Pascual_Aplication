//
//  MyProfileRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol MyProfileRouterProtocol: BaseRouterProtocol {
	func navigateToHome()
	func navigateToProductsUserList()
}

class MyProfileRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: MyProfileViewController? { return super.baseView as? MyProfileViewController }
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension MyProfileRouter: MyProfileRouterProtocol {
	
	func navigateToHome() {
		self.pushViewController(CustomTabBarAssembly.view(), animated: true)
	}
	
	func navigateToProductsUserList() {
		self.pushViewController(ProductsUserListAssembly.view(), animated: true)
	}
}
