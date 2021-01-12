//
//  HomeAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation
import UIKit

final class HomeAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> HomeViewController {
		let view = HomeViewController(nibName: Utils.getXib(.home), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: HomePresenter.self,
										  router: HomeRouter.self,
										  interactor: HomeInteractor.self)
		
		viper.interactor.homeProvider = DataAssembly.homeProvider(interactor: viper.interactor)
		
		return view
	}
}
