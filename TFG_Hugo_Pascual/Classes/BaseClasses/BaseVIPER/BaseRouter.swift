//
//  BaseRouter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit
import MapKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseRouter {
	
	// Declared weak for the ARC to destroy them.
	internal weak var baseView: UIViewController?
	weak var delegate: BaseRouterDelegate?
	
	required init() {}
	
	static func setRoot(navigationController: UIViewController) {
		
		guard let window = UIApplication.shared.delegate?.window else { return }
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
	
	// MARK: PRIVATE BASE
	internal func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.setViewControllers([viewControllerToPresent], animated: flag)
	}
	
	internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
	}
	
	internal func popViewController(animated: Bool) {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.popViewController(animated: animated)
	}
	
	internal func popToViewController(toViewController: UIViewController, animated: Bool) {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.popToViewController(toViewController, animated: animated)
	}
	
	internal func popToRootViewController() {
		self.delegate?.navigationDone()
		self.baseView?.navigationController?.popToRootViewController(animated: true)
	}
	
	internal func present(_ viewControllerToPresent: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
		self.delegate?.navigationDone()
		viewControllerToPresent.modalPresentationStyle = presentationStyle
		self.baseView?.present(viewControllerToPresent, animated: flag, completion: completion)
	}
	
	internal func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
		
		self.delegate?.navigationDone()
		self.baseView?.dismiss(animated: flag, completion: completion)
	}
	
	internal func dismissParent(animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
		
		self.delegate?.navigationDone()
		self.baseView?.presentingViewController?.dismiss(animated: flag, completion: completion)
	}
}
