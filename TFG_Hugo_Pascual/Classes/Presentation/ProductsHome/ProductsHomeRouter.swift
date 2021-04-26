//  
//  ProductsHomeRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/04/2021.
//

import Foundation

protocol ProductsHomeRouterProtocol: BaseRouterProtocol {
	func navigateToProductsList()
	func navigateToAddProduct()
}

class ProductsHomeRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsHomeViewControllerProtocol? { return super.baseView as? ProductsHomeViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsHomeRouter: ProductsHomeRouterProtocol {
	
	func navigateToProductsList() {
		print("NAVEGACION")
	}
	
	func navigateToAddProduct() {
		
	}
}
