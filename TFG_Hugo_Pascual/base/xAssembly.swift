//
//  Assembly.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//
//swiftlint:disable type_name

import Foundation
import UIKit

final class xAssembly: BaseAssembly {
	
	static func navigationController() -> UINavigationController {
		let navigationController = UINavigationController(rootViewController: view())
		return navigationController
	}
	
	static func view() -> xViewController {
		let view = xViewController(nibName: Utils.getXib(.xx), bundle: nil)
		
		let viper = BaseAssembly.assembly(baseView: view,
										  presenter: xPresenter.self,
										  router: xRouter.self,
										  interactor: xInteractor.self)
		
		viper.interactor.provider = yProvider(interactor: viper.interactor)
		return view
	}
	
	static func yProvider(interactor: BaseInteractor) -> xProviderProtocol {
		let provider = xProvider()
		provider.delegate = interactor as? BaseProviderDelegate
		return provider
	}

}

//Struct that represents the transfered object
struct xAssemblyDTO {
	
}
