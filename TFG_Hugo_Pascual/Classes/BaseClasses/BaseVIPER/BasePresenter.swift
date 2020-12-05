//
//  BasePresenter.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation

class BasePresenter {
	
	internal weak var baseView: BaseViewProtocol?
	internal var baseRouter: BaseRouterProtocol?
	internal var baseInteractor: BaseInteractorInputProtocol?
	
}
