//
//  HomeAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation
import UIKit

final class HomeAssembly: BaseAssembly {
	
	static func navigationController(dto: HomeAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view(dto: dto))
		return navigationController
	}
	
	static func view(dto: HomeAssemblyDTO? = nil) -> HomeViewController {
		
		let view = HomeViewController(nibName: Utils.getXib(.home), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: HomePresenter.self,
										  router: HomeRouter.self,
										  interactor: HomeInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		
		return view
	}
}

//Struct that represents the transfer object of Registration
struct HomeAssemblyDTO {
	
}
