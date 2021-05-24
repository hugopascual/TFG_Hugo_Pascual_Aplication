//
//  MyProfileAssembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

final class MyProfileAssembly: BaseAssembly {
	
	static func navigationController(dto: MyProfileAssemblyDTO? = nil) -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view(dto: MyProfileAssemblyDTO? = nil) -> MyProfileViewController {
		
		let view = MyProfileViewController(nibName: Utils.getXib(.myProfile), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: MyProfilePresenter.self,
										  router: MyProfileRouter.self,
										  interactor: MyProfileInteractor.self)
		
		viper.interactor.assemblyDTO = dto
		viper.interactor.loginProvider = DataAssembly.loginProvider(interactor: viper.interactor)
		
		return view
	}
}

//Struct that represents the transfer object of ProductDetail
struct MyProfileAssemblyDTO {
	
}
