//
//  NavigationBarManager.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation
import UIKit

protocol NavigationBarManagerDelegate: class {
	func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem)
	func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem)
	func backNavigationBarButtonPressed()
}

class NavigationBarManager {
	
	weak var viewController: UIViewController?
	weak var delegate: NavigationBarManagerDelegate?
	var customNavigationBarView: NavBarRegisterView?
	
	var model: NavigationBarModel?
	
	var isHidden: Bool = true {
		didSet {
			
			guard let type = model?.type else { return }
			
			switch type {
			case .normal:
				self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
			case .large:
				self.customNavigationBarView?.isHidden = isHidden
			}
		}
	}
	
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
	
	func setNavigationBar(backgroundImage: UIImage? = nil, backgroundColor: UIColor? = nil) {
		let navBar = self.navigationController?.navigationBar
		navBar?.setBackgroundImage(backgroundImage, for: UIBarMetrics.default)
		navBar?.shadowImage = UIImage()
		navBar?.titleTextAttributes = [NSAttributedString.Key.font: CustomFont(fontType: .cartero, size: .XL, style: .regular).uiFont, NSAttributedString.Key.foregroundColor: CustomColor.textNormal.uiColor]

		navBar?.barTintColor = backgroundColor
		navBar?.isTranslucent = false
	}
	
	func setNavigationBarTitleView(view: UIView?) {
		
		self.navigationItem?.titleView = view
		
	}
	
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
	
	func setNavigationBarBackButton(backButton: NavigationBarButtonItem) {
		let navBar = self.navigationController?.navigationBar
		navBar?.backIndicatorImage = backButton.image
		navBar?.backIndicatorTransitionMaskImage = backButton.image
		self.navigationItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
	}
	
	//Put text Cancel To the Button Cancel
	func setNavigationBarCancelButton(cancelButton: NavigationBarButtonItem) {
		let cancelButtonCustom = UIBarButtonItem(title: cancelButton.uiBarButtonItem?.title, style: .plain, target: self, action: nil)
		cancelButtonCustom.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cartero-Bold", size: 14)!], for: UIControl.State.normal)
		cancelButtonCustom.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cartero-Bold", size: 14)!], for: UIControl.State.selected)
		self.navigationItem?.rightBarButtonItem = cancelButtonCustom

	}
	
	func setTransparent(isTransparent: Bool) {
		
		if isTransparent {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
			navigationController?.navigationBar.shadowImage = UIImage()
			navigationController?.navigationBar.isTranslucent = true
		}
	}
	
	func getFrame() -> CGRect {
		
		guard let frame = self.navigationController?.navigationBar.frame else { return CGRect(x: 0, y: 0, width: 0, height: 0)}
		return frame
	}
	
	func configureNavigationBar(model: NavigationBarModel) {
		
		self.model = model
		
		guard model.type == .normal else {
			self.configureLargeNavigationBar(model: model)
			return
		}
		
		isHidden = false
		
		if let backButton = model.backButton { self.setNavigationBarBackButton(backButton: backButton) }
		if let arrayLeftButtons = model.arrayLeftButtons { self.setNavigationBarLeftButtonItems(arrayLeftButtons: arrayLeftButtons) }
		if let arrayRightButtons = model.arrayRightButtons { self.setNavigationBarRightButtonItems(arrayRightButtons: arrayRightButtons) }
		if let titleView = model.titleView { self.setNavigationBarTitleView(view: titleView) }
		self.setNavigationBar(backgroundImage: model.backgroundImage ?? UIImage(named: "default"), backgroundColor: model.backGroundColor)
		if model.isTransparent { self.setTransparent(isTransparent: model.isTransparent) }
		if let title = model.title { self.title = title }

	}
	
	func configureLargeNavigationBar(model: NavigationBarModel) {
		
		isHidden = false
		
		switch model {
		case let model as NavigationBarProgressModel:
			if customNavigationBarView == nil {
				addProgressNavigationBarView(verticalSpacingMainSubviewAndNavigationBar: model.verticalSpacingMainSubviewAndNavigationBar)
			}
			customNavigationBarView?.setProgressView(model: model)
			return
		default:
			break
		}
		
		if customNavigationBarView == nil {
			addProgressNavigationBarView(verticalSpacingMainSubviewAndNavigationBar: model.verticalSpacingMainSubviewAndNavigationBar)
		}
		customNavigationBarView?.setProgressView(model: model)
		customNavigationBarView?.titleLabelText.text = model.title
	}
	
	func addProgressNavigationBarView(verticalSpacingMainSubviewAndNavigationBar: Float) {
		guard let mainView = viewController?.view else { return }
		
		let mainSubview = mainView.subviews.first
		mainSubview?.findConstraint(layoutAttribute: .top)?.isActive = false
		
		let heightNavBar: CGFloat = 180
		let viewNavbar = NavBarRegisterView(frame: CGRect(x: mainView.bounds.origin.x, y: mainView.bounds.origin.y, width: mainView.bounds.width, height: heightNavBar))
		self.customNavigationBarView = viewNavbar
		self.customNavigationBarView?.delegate = self
		
		mainView.insertSubview(viewNavbar, at: 0)
		viewNavbar.translatesAutoresizingMaskIntoConstraints = false
		
		mainView.addConstraint(NSLayoutConstraint(item: viewNavbar,
												  attribute: .top,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .top,
												  multiplier: 1.0,
												  constant: 0))
		
		mainView.addConstraint(NSLayoutConstraint(item: viewNavbar,
												  attribute: .bottom,
												  relatedBy: .equal,
												  toItem: mainSubview,
												  attribute: .top,
												  multiplier: 1.0,
												  constant: CGFloat(verticalSpacingMainSubviewAndNavigationBar)))
		
		mainView.addConstraint(NSLayoutConstraint(item: viewNavbar,
												  attribute: .trailing,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .trailing,
												  multiplier: 1.0,
												  constant: 0))
		
		mainView.addConstraint(NSLayoutConstraint(item: viewNavbar,
												  attribute: .height,
												  relatedBy: .equal,
												  toItem: nil,
												  attribute: .height,
												  multiplier: 1.0,
												  constant: heightNavBar))
		
		mainView.addConstraint(NSLayoutConstraint(item: viewNavbar,
												  attribute: .leading,
												  relatedBy: .equal,
												  toItem: mainView,
												  attribute: .leading,
												  multiplier: 1.0,
												  constant: 0))
		
		viewNavbar.layoutIfNeeded()

	}
	
	func navigationBarLeftButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarLeftButtonItemPressed(buttonItem: buttonItem)
	}
	
	func navigationBarRightButtonItemPressed(_ buttonItem: NavigationBarButtonItem) {
		self.delegate?.navigationBarRightButtonItemPressed(buttonItem: buttonItem)
	}
}

extension NavigationBarManager: NavBarRegisterProtocol {
	func back() {
		self.delegate?.backNavigationBarButtonPressed()
	}
	
	func cancel() {
		self.delegate?.navigationBarRightButtonItemPressed(buttonItem: .cancelButton)
	}
}
