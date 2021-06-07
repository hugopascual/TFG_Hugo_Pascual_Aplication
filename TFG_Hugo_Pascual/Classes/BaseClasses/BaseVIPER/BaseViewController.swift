//
//  BaseViewController.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, NavigationBarManagerDelegate {
	
	var basePresenter: BasePresenterProtocol?
	var navigationBarManager: NavigationBarManager?
	
	var isFirstPresentation: Bool = true // Necesario para realizar el refresh de la pantalla, solo cuando se hace push, y no pop.

	override func viewDidLoad() {
		super.viewDidLoad()
		self.initializeUI()
		
		// MARK: Initialice navigation bar
		self.navigationBarManager = NavigationBarManager(viewController: self)
		self.navigationBarManager?.delegate = self
		self.navigationBarManager?.configureNavigationBar(model: NavigationBarModel(title: "", backButton: .backArrow, backGroundColor: CustomColor.viewPrimary.uiColor))
		
		self.basePresenter?.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
		
		self.basePresenter?.viewWillAppear(isFirstPresentation: self.isFirstPresentation)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.basePresenter?.viewDidAppear(isFirstPresentation: self.isFirstPresentation)
		self.isFirstPresentation = false
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.basePresenter?.viewWillDisappear()
	}
	
	func initializeUI() {}
	
	// MARK: NavigationBar
	func navigationBarLeftButtonItemPressed(buttonItem: NavigationBarButtonItem) {}
	func navigationBarRightButtonItemPressed(buttonItem: NavigationBarButtonItem) {}

	// MARK: Loader
	func showLoading(fullScreen: Bool) {
		Loader.showProgressHud()
	}
	
	func hideLoading() {
		Loader.hideProgressHud()
	}
	
	// MARK: Toast
	func showToast(viewModel: ToastViewModel) {
		guard let toast = ToastView.initFromNib() else { return }
		toast.configure(viewModel: viewModel)

		UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubviewWithConstraintsWithoutBottom(UIEdgeInsets(top: 40, left: 24, bottom: 0, right: -24), subView: toast)
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
			toast.removeFromSuperview()
		}
	}
	
	func showInfoToast(viewModel: ToastViewModel) {
		guard let toast = ToastView.initFromNib() else { return }
		toast.configure(viewModel: viewModel)
		
		UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubviewWithConstraintsWithoutBottom(UIEdgeInsets(top: 40, left: 24, bottom: 0, right: -24), subView: toast)
	}
	
	// MARK: Error
	func showError(error: CustomErrorModel) {
		self.showToast(viewModel: ToastViewModel(type: .error, title: error.backendError.serverMessage))
	}
}
