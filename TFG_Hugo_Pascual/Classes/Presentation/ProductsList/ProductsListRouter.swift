//  
//  ProductsListRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 22/04/2021.
//

import Foundation

protocol ProductsListRouterProtocol: BaseRouterProtocol {
	
}

class ProductsListRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductsListViewControllerProtocol? { return super.baseView as? ProductsListViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductsListRouter: ProductsListRouterProtocol {
	
}
