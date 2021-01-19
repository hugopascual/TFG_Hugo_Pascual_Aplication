//
//  CustomTabBarViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 17/01/2021.
//

import Foundation
import UIKit

enum Tab: Int {
	case undefined = -1
	case home
	case addProduct
	case profile
}

protocol CustomTabBarViewProtocol: BaseViewProtocol {
	func selectTab(_ tab: Tab)
	func deselectTabs(_ arrayTabs: [Tab])
}

class CustomTabBarViewController: BaseViewController {
	
	// MARK: VIPER Dependencies
	var presenter: CustomTabBarPresenterProtocol? { return super.basePresenter as? CustomTabBarPresenterProtocol }
	
	// MARK: IBOutlets declaration of all controls
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var tabBarView: UIView!
	@IBOutlet var tabBarButtonsArray: [UIButton]!
	
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
	
	// MARK: UIViewController Functions
	override func viewDidLoad() {
		UITextField.appearance().tintColor = CustomColor.viewPrimary.uiColor
		UITextView.appearance().tintColor = CustomColor.viewPrimary.uiColor
		
		super.viewDidLoad()
		self.setupView()
	}

	// MARK: IBActions declaration of all the controls
	@IBAction func tabBarButtonPressed(_ sender: UIButton) {
		//Remenber to force tag value in every button to avoid problems
		let selectedTab = getTabFromIndex(sender.tag)
		self.presenter?.buttonTabPressed(selectedTab)
	}
	
	// MARK: Private Functions
	func setupView() {
		self.tabBarView.applyShadowWithCorner(cornerRadius: 28, opacity: 0.13, blur: 32)
	}
	
	func selectTabButton(_ tab: Tab) {
		
		guard tabBarButtonsArray.indices.contains(tab.rawValue) else { return }
		
		let button = tabBarButtonsArray[tab.rawValue]
		
		button.isSelected = true
		button.backgroundColor = CustomColor.viewPrimary.uiColor
		
		switch tab {
		case .home:
			button.setImage(#imageLiteral(resourceName: "home_icon"), for: .normal)
		case .addProduct:
			button.setImage(#imageLiteral(resourceName: "add_product_icon"), for: .normal)
		case .profile:
			button.setImage(#imageLiteral(resourceName: "profile_icon"), for: .normal)
		default:
			break
		}
	}
	
	func deselectTabButton(_ tab: Tab) {
		
		guard tabBarButtonsArray.indices.contains(tab.rawValue) else { return }
		
		let button = tabBarButtonsArray[tab.rawValue]
		
		button.isSelected = false
		button.backgroundColor = CustomColor.viewGeneralBackground.uiColor
		
		switch tab {
		case .home:
			button.setImage(#imageLiteral(resourceName: "home_icon"), for: .normal)
		case .addProduct:
			button.setImage(#imageLiteral(resourceName: "add_product_icon"), for: .normal)
		case .profile:
			button.setImage(#imageLiteral(resourceName: "profile_icon"), for: .normal)
		default:
			break
		}
	}
	
	func getTabFromIndex(_ index: Int) -> Tab {
		return Tab(rawValue: index) ?? .undefined
	}
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension CustomTabBarViewController: CustomTabBarViewProtocol {

	func selectTab(_ tab: Tab) {
		self.selectTabButton(tab)
	}
	
	func deselectTabs(_ arrayTabs: [Tab]) {
		arrayTabs.forEach { self.deselectTabButton($0) }
	}
}
