//
//  CustomTabBarInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 17/01/2021.
//

import Foundation

protocol CustomTabBarInteractorInputProtocol: BaseInteractorInputProtocol {
	var assemblyDTO: CustomTabBarAssemblyDTO? { get }
}

class CustomTabBarInteractor: BaseInteractor {
	
	// MARK: VIPER Dependencies
	weak var presenter: CustomTabBarInteractorOutputProtocol? { return super.basePresenter as? CustomTabBarInteractorOutputProtocol }
	
	var assemblyDTO: CustomTabBarAssemblyDTO?
	// MARK: Private Functions
	
}

extension CustomTabBarInteractor: CustomTabBarInteractorInputProtocol {

}
