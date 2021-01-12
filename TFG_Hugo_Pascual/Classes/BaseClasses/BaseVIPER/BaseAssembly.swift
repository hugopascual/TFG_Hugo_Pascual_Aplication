//
//  BaseAssembly.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//
//swiftlint:disable large_tuple

import Foundation
import UIKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseAssembly {
	
	static func assembly<View: BaseViewController,
		Presenter: BasePresenter,
		Router: BaseRouter,
		Interactor: BaseInteractor>(baseView: View, presenter: Presenter.Type, router: Router.Type, interactor: Interactor.Type)
		-> (view: View, presenter: Presenter, interactor: Interactor, router: Router) {

		let basePresenter = Presenter()
		let baseRouter = Router()
		let baseInteractor = Interactor()

		baseView.basePresenter = basePresenter as? BasePresenterProtocol

		basePresenter.baseView = baseView as? BaseViewProtocol
		basePresenter.baseRouter = baseRouter as? BaseRouterProtocol
		basePresenter.baseInteractor = baseInteractor as? BaseInteractorInputProtocol

		baseRouter.baseView = baseView
		baseRouter.delegate = basePresenter

		baseInteractor.basePresenter = basePresenter as? BaseInteractorOutputProtocol
		return (baseView, basePresenter, baseInteractor, baseRouter)
	}
}
