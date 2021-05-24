//
//  CustomTabBarAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 17/01/2021.
//

import Foundation
import UIKit

final class CustomTabBarAssembly: BaseAssembly {

	static func navigationController(dto: CustomTabBarAssemblyDTO? = nil) -> UINavigationController {

		let navigationController = UINavigationController(rootViewController: view(dto: dto))

		return navigationController
	}

	static func view(dto: CustomTabBarAssemblyDTO? = nil) -> CustomTabBarViewController {

		let view = CustomTabBarViewController(nibName: Utils.getXib(.customTabBarViewController), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: CustomTabBarPresenter.self,
										  router: CustomTabBarRouter.self,
										  interactor: CustomTabBarInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.router.viewControllers = [HomeAssembly.view(),
										ProductsHomeAssembly.view(),
										MyProfileAssembly.view()]

		return view
	}
}

//Struct that represents the transfer object of CustomTabBar
struct CustomTabBarAssemblyDTO {
	
}
