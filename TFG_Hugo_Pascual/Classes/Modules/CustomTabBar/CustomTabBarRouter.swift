//
//  CustomTabBarRouter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 17/01/2021.
//

import Foundation
import UIKit

protocol CustomTabBarRouterProtocol: BaseRouterProtocol {
	func switchTabs(newTab: Tab, previousTab: Tab?)
}

final class CustomTabBarRouter: BaseRouter {

	// MARK: VIPER Dependencies
	weak var view: CustomTabBarViewController? { return super.baseView as? CustomTabBarViewController }
	
	// MARK: Atributes
	var viewControllers: [UIViewController] = []
	
	// MARK: Private Functions
}

extension CustomTabBarRouter: CustomTabBarRouterProtocol {
	func switchTabs(newTab: Tab, previousTab: Tab?) {
		guard let view = self.view else { return }
		
		if let previousTab = previousTab {
			let previousVC = viewControllers[previousTab.rawValue]
			
			previousVC.willMove(toParent: nil)
			previousVC.view.removeFromSuperview()
			previousVC.removeFromParent()
		}
		
		let viewController = viewControllers[newTab.rawValue]
		view.addChild(viewController)
		
		view.contentView.addSubview(viewController.view)
		viewController.didMove(toParent: self.view)
		viewController.view.frame = view.contentView.bounds
		
		// Notify to ViewControllers that tab is changed
		self.viewControllers.forEach { (($0 as? BaseViewController)?.basePresenter as? CustomTabBarProtocol)?.switchTabs(newTab: newTab, previousTab: previousTab) }
	}
}
