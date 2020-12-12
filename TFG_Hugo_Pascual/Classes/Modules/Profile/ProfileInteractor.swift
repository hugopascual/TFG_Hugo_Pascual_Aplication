//
//  ProfileInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	
}

class ProfileInteractor: BaseInteractor {
	
	weak var presenter: ProfileInteractorOutputProtocol? { return super.basePresenter as? ProfileInteractorOutputProtocol }
	var provider: ProfileProviderProtocol?
	
}

extension ProfileInteractor: ProfileInteractorInputProtocol {
	
}
