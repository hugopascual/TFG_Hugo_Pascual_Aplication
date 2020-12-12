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
	
	// MARK: PRIVATE BASE
	
	internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
	}
}
