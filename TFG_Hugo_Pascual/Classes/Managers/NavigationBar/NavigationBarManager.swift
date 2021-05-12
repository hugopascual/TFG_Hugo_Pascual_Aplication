//
//  NavigationBarManager.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 03/01/2021.
//

import Foundation
import UIKit

protocol NavigationBarManagerDelegate: class {
	func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem)
	func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem)
}

class NavigationBarManager {
	
	weak var viewController: UIViewController?
	weak var delegate: NavigationBarManagerDelegate?
	
	var navigationController: UINavigationController? {
		return self.viewController?.navigationController
	}
	var navigationItem: UINavigationItem? {
		return self.viewController?.navigationItem
	}
	var title: String? {
		get {
			return self.viewController?.title
		}
		set {
			self.viewController?.title = newValue
		}
	}
	private var arrayRightButtons: [NavigationBarButtonItem]?
	private var arrayLeftButtons: [NavigationBarButtonItem]?
	
	init(viewController: UIViewController) {
		self.viewController = viewController
		self.delegate = viewController as? NavigationBarManagerDelegate
	}
	
	// MARK: Manager functions
	func navigationBarLeftButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarLeftButtonItemPressed(buttonItem: buttonItem)
	}
	
	func navigationBarRightButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarRightButtonItemPressed(buttonItem: buttonItem)
	}
	
	// MARK: NavigationBar Configuration Functions
	func configureNavigationBar(model: NavigationBarModel) {
		
		if let backButton = model.backButton { self.setNavigationBarBackButton(backButton: backButton) }
		if let arrayLeftButtons = model.arrayLeftButtons { self.setNavigationBarLeftButtonItems(arrayLeftButtons: arrayLeftButtons) }
		if let arrayRightButtons = model.arrayRightButtons { self.setNavigationBarRightButtonItems(arrayRightButtons: arrayRightButtons) }
		if let titleView = model.titleView { self.setNavigationBarTitleView(view: titleView) }
		self.setNavigationBar(backgroundImage: model.backgroundImage ?? UIImage(named: "default"), backgroundColor: model.backGroundColor)
		if model.isTransparent { self.setTransparent(isTransparent: model.isTransparent) }
		if let title = model.title { self.title = title }
	}
	
	func setNavigationBar(backgroundImage: UIImage? = nil, backgroundColor: UIColor? = nil) {
		let navBar = self.navigationController?.navigationBar
		navBar?.setBackgroundImage(backgroundImage, for: UIBarMetrics.default)
		navBar?.titleTextAttributes = [NSAttributedString.Key.font: CustomFont(fontType: .system, size: .XL, style: .regular).uiFont, NSAttributedString.Key.foregroundColor: CustomColor.textNormal.uiColor]
		navBar?.barTintColor = backgroundColor
		navBar?.isTranslucent = false
	}
	
	func setNavigationBarBackButton(backButton: NavigationBarButtonItem) {
		let navBar = self.navigationController?.navigationBar
		navBar?.backIndicatorImage = backButton.image
		navBar?.backIndicatorTransitionMaskImage = backButton.image
		self.navigationItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}

	//If leftBarButtonItem is nil, controller displays backItem
	func setNavigationBarLeftButtonItems(arrayLeftButtons: [NavigationBarButtonItem]) {
		
		self.arrayLeftButtons = arrayLeftButtons
		
		self.navigationItem?.leftBarButtonItems = NavigationBarButtonItem.transformNavigationItemsToUI(
			arrayNavigationBarButtonItems: arrayLeftButtons,
			handler: self.navigationBarLeftButtonItemPressed(_:))
	}
	
	func setNavigationBarRightButtonItems(arrayRightButtons: [NavigationBarButtonItem]) {
		
		self.arrayRightButtons = arrayRightButtons
		
		self.navigationItem?.rightBarButtonItems = NavigationBarButtonItem.transformNavigationItemsToUI(
			arrayNavigationBarButtonItems: arrayRightButtons,
			handler: self.navigationBarRightButtonItemPressed(_:))
	}
	
	func setTransparent(isTransparent: Bool) {
		if isTransparent {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
			navigationController?.navigationBar.shadowImage = UIImage()
			navigationController?.navigationBar.isTranslucent = true
		}
	}
	
	func setNavigationBarTitleView(view: UIView?) {
		
		self.navigationItem?.titleView = view
	}
	
	func getFrame() -> CGRect {
		guard let frame = self.navigationController?.navigationBar.frame else { return CGRect(x: 0, y: 0, width: 0, height: 0)}
		return frame
	}
}

extension NavigationBarManager {
	
	//Put text Cancel To the Button Cancel
	func setNavigationBarCancelButton(cancelButton: NavigationBarButtonItem) {
		let cancelButtonCustom = UIBarButtonItem(title: LocalizedKeys.Common.cancel, style: .plain, target: self, action: nil)
		cancelButtonCustom.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cartero-Bold", size: 14)!], for: UIControl.State.normal)
		cancelButtonCustom.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cartero-Bold", size: 14)!], for: UIControl.State.selected)
		self.navigationItem?.rightBarButtonItem = cancelButtonCustom
	}
}
