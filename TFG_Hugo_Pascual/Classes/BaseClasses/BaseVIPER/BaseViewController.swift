//
//  BaseViewController.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//
//swiftlint:disable vertical_parameter_alignment

import Foundation
import UIKit

class BaseViewController: UIViewController, NavigationBarManagerDelegate {
	
	var basePresenter: BasePresenterProtocol?
	var navigationBarManager: NavigationBarManager?
	
	var isFirstPresentation: Bool = true // Necesario para realizar el refresh de la pantalla, solo cuando se hace push, y no pop.
	
//	var arrayViewError = [CustomErrorView]()

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
//		Loader.showProgressHud()
	}
	
	func hideLoading() {
//		Loader.hideProgressHud()
	}
	
//	func showError(error: CustomErrorViewModel) {
//		if error.contentType == .fullscreen {
//			self.navigationController?.setNavigationBarHidden(false, animated: false)
//		}
//
//		self.errorCustomView(error: error)
//	}
	
//	func errorCustomView(_ view: UIView? = nil, error: CustomErrorViewModel, delegate: Any? = nil) {
//
//		if error.contentType == .modal {
//			self.showModalError(error: error)
//			return
//		}
//
//		if error.contentType == .toast {
//			self.showToastInView(view, viewModel: ToastViewModel(type: .error, title: error.textDescription))
//			return
//		}
//
//		guard let genericError = CustomErrorView.initFromNib() else { return }
//		genericError.configure(viewModel: error)
//		genericError.delegate = delegate as? CustomErrorViewDelegate == nil
//			? self.basePresenter as? CustomErrorViewDelegate
//			: delegate as? CustomErrorViewDelegate
//
//		let constraints = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//
//		if self.findErrorViewIndex(of: error.errorType) == nil {
//			if let view = view {
//				view.addSubviewWithConstraints(constraints, subView: genericError)
//			} else {
//				self.view.addSubviewWithConstraints(constraints, subView: genericError)
//			}
//
//			self.arrayViewError.append(genericError)
//		}
//	}
	
//	func showModalError(error: CustomErrorViewModel) {
//		let alert = IsbnAlertView()
//		alert.delegate = self.basePresenter as? IsbnAlertViewDelegate
//		alert.setErrorModel(errorModel: error)
//		alert.modalPresentationStyle = .overFullScreen
//		alert.modalTransitionStyle = .crossDissolve
//		self.present(alert, animated: true, completion: nil)
//	}
	
//	func showToastInView(_ view: UIView? = nil, viewModel: ToastViewModel) {
//		guard let view = view else {
//			self.showToast(viewModel: viewModel)
//			return
//		}
//
//		guard let toast = ToastView.initFromNib() else { return }
//		toast.configure(viewModel: viewModel)
//
//		view.addSubviewWithoutTopConstraint(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), subView: toast)
//
//		switch viewModel.type {
//		case .info, .error, .success:
//			view.isHidden = false
//			DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
//				toast.removeFromSuperview()
//				view.isHidden = true
//			}
//		default:
//			break
//		}
//	}

//	func showToast(viewModel: ToastViewModel) {
//		guard let toast = ToastView.initFromNib() else { return }
//		toast.configure(viewModel: viewModel)
//
//		self.view.addSubviewWithoutTopConstraint(UIEdgeInsets(top: 0, left: 24, bottom: -70, right: -24), subView: toast)
//
//		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
//			toast.removeFromSuperview()
//		}
//	}
	
//	func showInfoToast(viewModel: ToastViewModel) {
//		guard let toast = ToastView.initFromNib() else { return }
//		toast.configure(viewModel: viewModel)
//
//		self.view.addSubviewWithoutTopConstraint(UIEdgeInsets(top: 0, left: 24, bottom: -70, right: -24), subView: toast)
//	}

//	func hideError(type: ViewError) {
//		guard let index = findErrorViewIndex(of: type), self.arrayViewError.indices.contains(index) else { return }
//
//		self.arrayViewError[index].removeFromSuperview()
//		self.arrayViewError.remove(at: index)
//	}
	
//	func findErrorViewIndex(of type: ViewError) -> Int? {
//		for index in 0..<self.arrayViewError.count {
//			guard let viewModel = self.arrayViewError[index].viewModel else { continue }
//			if viewModel.errorType == type {
//				return index
//			}
//		}
//		return nil
//	}
	
	func show(actionSheet: UIAlertController?,
			  parent: UIView,
			  over subView: UIView) {
		
		guard let actionSheet = actionSheet else { return }
		
		// For iPad
		if let popoverController = actionSheet.popoverPresentationController {
			
			popoverController.sourceView = self.view
			let frame = parent.convert(subView.frame, to: self.view)
			popoverController.sourceRect = frame
		}
		
		self.present(actionSheet, animated: true)
	}
}

// MARK: BaseViewControllerProtocol
extension BaseViewController {
	
//	func showAlertWith(title: String?, message: String?, actions: [CustomAlertAction]?) {
//
//		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//		if let actions = actions {
//			for action in actions {
//				alert.addAction(UIAlertAction(title: action.title, style: .default, handler: { _ in
//					action.handler?(action)
//				}))
//			}
//		} else {
//			alert.addAction(UIAlertAction(title: "logout_inactivity_alert_accept_button".localized, style: UIAlertAction.Style.default, handler: nil))
//		}
//		self.present(alert, animated: true, completion: nil)
//	}
	
//	func showNetworkAlert() {
//		let alert = NetworkAlertView()
//		alert.delegate = self.basePresenter as? NetworkAlertViewDelegate
//		alert.modalTransitionStyle = .crossDissolve
//		self.present(alert, animated: true, completion: nil)
//	}
	
//	func showCustomAlert(viewModel: CustomAlertViewModel) {
//
//		let alertController = CustomAlertController(nibName: "CustomAlertController", bundle: nil)
//
//		alertController.configure(viewModel: viewModel)
//
//		alertController.modalPresentationStyle = .overCurrentContext
//		alertController.modalTransitionStyle = .crossDissolve
//
//		self.present(alertController, animated: true)
//	}
	
//	func showModalAlert(viewModel: ModalAlertViewModel) {
//
//		let view = GenericModalViewController()
//
//		view.configure(viewModel: viewModel)
//
//		view.modalPresentationStyle = .overCurrentContext
//		view.modalTransitionStyle = .crossDissolve
//
//		self.present(view, animated: true)
//	}
}
