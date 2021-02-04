//
//  RegistrationInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/02/2021.
//

import Foundation

protocol RegistrationInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class RegistrationInteractor: BaseInteractor {
	
	var presenter: RegistrationInteractorOutputProtocol? { return super.basePresenter as? RegistrationInteractorOutputProtocol }
	
}

extension RegistrationInteractor: RegistrationInteractorInputProtocol {
	
}
