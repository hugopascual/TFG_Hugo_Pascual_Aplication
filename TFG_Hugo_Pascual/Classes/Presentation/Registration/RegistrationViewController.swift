//
//  RegistrationViewController.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

protocol RegistrationViewControllerProtocol: BaseViewControllerProtocol {
	
}

class RegistrationViewController: BaseViewController {
	
	var presenter: RegistrationPresenterProtocol? { return super.basePresenter as? RegistrationPresenterProtocol }
	
}

extension RegistrationViewController: RegistrationViewControllerProtocol {
	
}
