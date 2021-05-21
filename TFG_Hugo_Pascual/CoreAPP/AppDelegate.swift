//
//  AppDelegate.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var appInitializer = AppInitializer()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		
		if window != nil {
			self.appInitializer.installRootViewController()
		}
		
		DataPersisterHelper.standard.removeAllKeyChainData()
		
		return true
	}
}
