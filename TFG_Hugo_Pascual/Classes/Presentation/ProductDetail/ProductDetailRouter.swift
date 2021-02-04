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
	
	weak var view: ProductDetailViewController? { return super.baseView as? ProductDetailViewController }
	
}

extension ProductDetailRouter: ProductDetailRouterProtocol {

}
