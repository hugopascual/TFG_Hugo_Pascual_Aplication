//
//  HomeROuter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomeRouterProtocol: BaseRouterProtocol {
	func navigateToProductDetail()
}

class HomeRouter: BaseRouter {
	
	weak var view: HomeViewController? { return super.baseView as? HomeViewController }
	
}

extension HomeRouter: HomeRouterProtocol {
	
	func navigateToProductDetail() {
		self.pushViewController(ProductDetailAssembly.view(), animated: true)
	}
	
}
