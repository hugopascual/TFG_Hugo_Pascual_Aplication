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
		
//		IQKeyboardManager.shared.enable = true
//		IQKeyboardManager.shared.enableAutoToolbar = false
//		IQKeyboardManager.shared.shouldResignOnTouchOutside = true
		//IQKeyboardManager.shared.keyboardDistanceFromTextField = 60
		
//		FirebaseApp.configure()
		
		BaseRouter.setRoot(navigationController: HomeAssembly.navigationController())
//        if let walkthroughShowed = DataPersisterHelper.standard.walkthroughShowed, let dataProtectionShowed = DataPersisterHelper.standard.dataProtectionAccepted {
//            if !walkthroughShowed {
//                BaseRouter.setRoot(navigationController: WalkthroughAssembly.navigationController())
//            } else if walkthroughShowed && !dataProtectionShowed {
//                BaseRouter.setRoot(navigationController: DataProtectionTermsAssembly.navigationController())
//            } else {
//                BaseRouter.setRoot(navigationController: CustomTabBarAssembly.navigationController())
//            }
//    }
	}
}
