//
//  ProfileRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfileRouterProtocol: BaseRouterProtocol {
	func navigateToHome()
}

class ProfileRouter: BaseRouter {
	
	weak var view: ProfileViewController? { return super.baseView as? ProfileViewController }
	
}

extension ProfileRouter: ProfileRouterProtocol {
	
	func navigateToHome() {
		self.pushViewController(HomeAssembly.view(), animated: true)
	}
	
}
