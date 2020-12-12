//
//  Router.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation

protocol xRouterProtocol: BaseRouterProtocol {
	
}

class xRouter: BaseRouter {
	
	weak var view: xViewController? { return super.baseView as? xViewController }
	
}

extension xRouter: xRouterProtocol {
	
}
