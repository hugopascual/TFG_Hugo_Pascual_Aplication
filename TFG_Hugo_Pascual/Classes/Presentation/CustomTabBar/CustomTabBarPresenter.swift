//
//  CustomTabBarPresenter.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 17/01/2021.
//

import Foundation

protocol CustomTabBarProtocol: class {
	func switchTabs(newTab: Tab, previousTab: Tab?)
}

protocol CustomTabBarPresenterProtocol: BasePresenterProtocol {
	func buttonTabPressed(_ tab: Tab)
}

protocol CustomTabBarInteractorOutputProtocol: BaseInteractorOutputProtocol {
	
}

class CustomTabBarPresenter: BasePresenter {

	// MARK: VIPER Dependencies
	weak var view: CustomTabBarViewControllerProtocol? { return super.baseView as? CustomTabBarViewControllerProtocol }
	var router: CustomTabBarRouterProtocol? { return super.baseRouter as? CustomTabBarRouterProtocol }
	var interactor: CustomTabBarInteractorInputProtocol? { return super.baseInteractor as? CustomTabBarInteractorInputProtocol }
	
	let arrayTabs = [Tab.home, Tab.productList, Tab.profile]
	var selectedTab = Tab.home
	// MARK: Private Functions
	func viewDidLoad() {
		self.selectTab(.home)
	}
	
	func viewWillAppear(isFirstPresentation: Bool) {
	}
	
	private func selectTab(_ tab: Tab) {
		
		self.view?.deselectTabs(self.arrayTabs)
		self.view?.selectTab(tab)
		
		let previousTab = self.selectedTab
		self.selectedTab = tab
		self.router?.switchTabs(newTab: tab, previousTab: previousTab)
	}
	
	override func showError(error: CustomErrorModel) {
		print(error)
	}
}

extension CustomTabBarPresenter: CustomTabBarPresenterProtocol {

	func buttonTabPressed(_ tab: Tab) {
		
		let userLoginState = self.interactor?.getUserLoginState() ?? .noLogged
		let userNotLogged = userLoginState != .logged
		switch tab {
		case .profile:
			if userNotLogged {
				self.router?.navigateToLogin(dto: LoginAssemblyDTO(
					loginSuccess: {
						self.selectTab(.profile)
				}))
				return
			}
		default:
			break
		}
		
		self.selectTab(tab)
	}
}

extension CustomTabBarPresenter: CustomTabBarInteractorOutputProtocol {
	
}
