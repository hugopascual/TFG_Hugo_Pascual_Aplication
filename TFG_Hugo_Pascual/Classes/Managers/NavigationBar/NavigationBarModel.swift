//
//  NavigationBarModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 03/01/2021.
//

import Foundation
import UIKit

struct NavigationBarModel {
	
	var title: String?
	var backButton: NavigationBarButtonItem?
	var arrayLeftButtons: [NavigationBarButtonItem]?
	var arrayRightButtons: [NavigationBarButtonItem]?
	var titleView: UIView?
	var backgroundImage: UIImage?
	var backGroundColor: UIColor?
	var isTransparent = false
	
	init(title: String? = nil, backButton: NavigationBarButtonItem? = nil, arrayLeftButtons: [NavigationBarButtonItem]? = nil, arrayRightButtons: [NavigationBarButtonItem]? = nil, titleView: UIView? = nil, backgroundImage: UIImage? = nil, backGroundColor: UIColor? = nil, isTransparent: Bool = false) {
		
		self.title = title
		self.backButton = backButton
		self.arrayLeftButtons = arrayLeftButtons
		self.arrayRightButtons = arrayRightButtons
		self.titleView = titleView
		self.backgroundImage = backgroundImage
		self.backGroundColor = backGroundColor
		self.isTransparent = isTransparent
	}
}

class NavigationBarButtonItem {
	
	private var icon: UIImage?
	private var text: String?
	private var font: CustomFont?
	private var color: UIColor?
	var isEnabled = true
	var type: NavigationButtonType
	var resourceType: ResourceType
	
	var uiBarButtonItem: UIBarButtonItem?
	var handler: ((NavigationBarButtonItem) -> Void)?
	
	enum ResourceType {
		case image
		case freeText
	}
	
	enum NavigationButtonType {
//		case logo
		case back
//		case close
//		case cancel
//		case information
//		case options
	}
	
	init(type: NavigationButtonType, icon: UIImage, isEnabled: Bool = true) {
		self.resourceType = .image
		self.type = type
		self.icon = icon
		self.isEnabled = isEnabled
	}

	init(type: NavigationButtonType, text: String, font: CustomFont, color: UIColor, isEnabled: Bool = true) {
		self.resourceType = .freeText
		self.type = type
		self.text = text
		self.font = font
		self.color = color
		self.isEnabled = isEnabled
	}
	
	var image: UIImage? {
		return self.icon?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
	}
	
	@objc func navigationBarButtonItemPressed(sender: UIBarButtonItem) {
		self.handler?(self)
	}
	
	func initUIButtonItem() {
		
		if self.resourceType == .image {
		
			self.uiBarButtonItem = UIBarButtonItem(
				image: self.image,
				style: .plain,
				target: self,
				action: #selector(navigationBarButtonItemPressed(sender:)))
		} else {
			
			self.uiBarButtonItem = UIBarButtonItem(
						title: self.text,
						style: .plain,
						target: self,
						action: #selector(navigationBarButtonItemPressed(sender:)))
			self.uiBarButtonItem?.tintColor = self.color
			if let font = self.font {
				self.uiBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: font.uiFont], for: .normal)
				self.uiBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: font.uiFont], for: .highlighted)
			}
		}
		
		self.uiBarButtonItem?.isEnabled = self.isEnabled
	}
	
	static func transformNavigationItemsToUI(arrayNavigationBarButtonItems: [NavigationBarButtonItem], handler: @escaping (NavigationBarButtonItem) -> Void) -> [UIBarButtonItem] {
		
		return arrayNavigationBarButtonItems.map { rightButtonItem -> UIBarButtonItem? in
			
			rightButtonItem.handler = handler
			rightButtonItem.initUIButtonItem()
			
			return rightButtonItem.uiBarButtonItem
			
		}.compactMap({ $0 })
	}
	
}

extension NavigationBarButtonItem {
//	static var logo = NavigationBarButtonItem(type: .logo, icon: #imageLiteral(resourceName: "etsitLogo"))
	static var backArrow = NavigationBarButtonItem(type: .back, icon: #imageLiteral(resourceName: "back_arrow_icon"), isEnabled: true)
//	static var closeButton = NavigationBarButtonItem(type: .close, icon: #imageLiteral(resourceName: "etsitLogo"), isEnabled: true)
//  static var cancelButton = NavigationBarButtonItem(type: .cancel, icon: #imageLiteral(resourceName: "etsitLogo"), isEnabled: true)
//	static var information = NavigationBarButtonItem(type: .information, icon: #imageLiteral(resourceName: "etsitLogo"), isEnabled: true)
//	static var options = NavigationBarButtonItem(type: .options, icon: #imageLiteral(resourceName: "etsitLogo"), isEnabled: true)
}
