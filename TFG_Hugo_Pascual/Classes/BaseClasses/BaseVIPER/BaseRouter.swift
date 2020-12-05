//
//  BaseRouter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

class BaseRouter {
	
	internal weak var baseView: UIViewController?
	weak var delegate: BaseRouterDelegate?
	
	required init() {}
	
	static func setRoot(navigationController: UIViewController) {
		
		guard let window = UIApplication.shared.delegate?.window else { return }
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}
