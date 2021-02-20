//  
//  ProductListRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 20/02/2021.
//

import Foundation

protocol ProductListRouterProtocol: BaseRouterProtocol {
	
}

class ProductListRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductListViewControllerProtocol? { return super.baseView as? ProductListViewControllerProtocol }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductListRouter: ProductListRouterProtocol {
	
}
