//
//  AddProductRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 14/01/2021.
//

import Foundation

protocol AddProductRouterProtocol: BaseRouterProtocol {

}

class AddProductRouter: BaseRouter {
	
	weak var view: AddProductViewController? { return super.baseView as? AddProductViewController }
	
}

extension AddProductRouter: AddProductRouterProtocol {

}
