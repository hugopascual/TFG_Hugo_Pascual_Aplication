//
//  CustomTabBar.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/01/2021.
//

import Foundation
import UIKit

protocol CustomTabBarDelegate: class {
	func tabBarButtonPressed(item: UITabBarItem)
}

class CustomTabBar: NSObject {
	
	weak var customDelegate: CustomTabBarDelegate?
	
	var tabBar: UITabBarController?
}

extension CustomTabBar: UITabBarControllerDelegate {
	
	func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		print(item.title ?? "pulsado general")
		self.customDelegate?.tabBarButtonPressed(item: item)
	}
}
