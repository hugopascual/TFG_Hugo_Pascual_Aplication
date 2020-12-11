//
//  AppInitializer.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

class AppInitializer: NSObject {
	
	//first we need to set up rootViewController
	func installRootViewController() {
		
		BaseRouter.setRoot(navigationController: HomeAssembly.navigationController())

	}
}
