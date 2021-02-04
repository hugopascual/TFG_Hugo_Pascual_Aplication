//
//  ProfileInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 12/12/2020.
//

import Foundation

protocol ProfileInteractorInputProtocol: BaseInteractorInputProtocol {
	func getProfile()
}

class ProfileInteractor: BaseInteractor {
	
	weak var presenter: ProfileInteractorOutputProtocol? { return super.basePresenter as? ProfileInteractorOutputProtocol }
	var profileProvider: ProfileProviderProtocol?
	
}

extension ProfileInteractor: ProfileInteractorInputProtocol {
	
	func getProfile() {
		let dto = ProfileDTO()
		
		self.profileProvider?.getProfile(dto: dto, additionalHeaders: [:], success: { (serverModel) in
			
			guard let businessModel = BaseInteractor.parseToBusinessModel(parserModel: ProfileBusinessModel.self, serverModel: serverModel) else { return }

			self.presenter?.didGetProfileInfo(businessModel: businessModel)
			
		}, failure: { (error) in
			
			error.backendError.type = .unknownError
			self.presenter?.didNotGetProfileInfo()
			self.presenter?.genericErrorHappened(error: error)
			
		})
		
	}
}
