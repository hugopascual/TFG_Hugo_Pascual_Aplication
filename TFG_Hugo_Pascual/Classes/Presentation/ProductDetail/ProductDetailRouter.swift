//
//  ProductDetailRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 16/01/2021.
//

import Foundation

protocol ProductDetailRouterProtocol: BaseRouterProtocol {

}

class ProductDetailRouter: BaseRouter {
	
	// MARK: VIPER Dependencies
	weak var view: ProductDetailViewController? { return super.baseView as? ProductDetailViewController }
	
	// MARK: Private Functions

}

// MARK: Extensions declaration of all extension and implementations of protocols
extension ProductDetailRouter: ProductDetailRouterProtocol {

}
