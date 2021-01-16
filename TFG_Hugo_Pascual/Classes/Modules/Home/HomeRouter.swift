//
//  HomeROuter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomeRouterProtocol: BaseRouterProtocol {
	func navigateToAddProduct()
}

class HomeRouter: BaseRouter {
	
	weak var view: HomeViewController? { return super.baseView as? HomeViewController }
	
}

extension HomeRouter: HomeRouterProtocol {
	
	func navigateToAddProduct() {
		self.pushViewController(AddProductAssembly.view(), animated: true)
	}
	
}
