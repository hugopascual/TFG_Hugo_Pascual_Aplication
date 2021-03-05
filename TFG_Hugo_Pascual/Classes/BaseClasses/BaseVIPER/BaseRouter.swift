//
//  BaseRouter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

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
	
	static func logout(viewController: UIViewController? = nil) {

		if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {

			navigationController.popToRootViewController(animated: true)

		} else {

			if let viewController = viewController {
				viewController.dismiss(animated: true, completion: nil)
			}
			if let navigationController = (UIApplication.shared.windows.first?.rootViewController as? UINavigationController) {
				navigationController.popToRootViewController(animated: true)
			}
		}
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
	
	func navigateToLogin(dto: LoginAssemblyDTO?) {
		self.delegate?.navigationDone()

		self.present(LoginAssembly.navigationController(dto: dto), animated: true)
	}
	
	func changeTabInCustomTabBar(tab: Tab) {
		
		guard let navigationViewController = self.baseView?.navigationController else { return }
		let viewController = navigationViewController.viewControllers.filter { $0 as? CustomTabBarViewControllerProtocol != nil }.first as? CustomTabBarViewController
		let presenter = viewController?.presenter as? CustomTabBarPresenter
		presenter?.buttonTabPressed(tab)
	}
}
