//
//  ProfileAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

final class ProfileAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> ProfileViewController {
		let view = ProfileViewController(nibName: Utils.getXib(.profile), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: ProfilePresenter.self,
										  router: ProfileRouter.self,
										  interactor: ProfileInteractor.self)
		
		viper.interactor.profileProvider = DataAssembly.profileProvider(interactor: viper.interactor)
		return view
	}
}

//Struct that represents the transfer object of ProductDetail
struct ProfileAssemblyDTO {
	var name: String
}
