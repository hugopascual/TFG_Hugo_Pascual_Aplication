//
//  HomeInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
	func getHome()
}

class HomeInteractor: BaseInteractor {
	
	weak var presenter: HomeInteractorOutputProtocol? { return super.basePresenter as? HomeInteractorOutputProtocol }
	var homeProvider: HomeProviderProtocol?
	var homeModel: HomeBusinessModel?
	
}

extension HomeInteractor: HomeInteractorInputProtocol {
	
	func getHome() {
		
		let dto = HomeDTO()
		
		self.homeProvider?.getHome(dto: dto, additionalHeaders: [:], success: { (serverModel) in
			
			guard let businessModel = BaseInteractor.parseToBusinessModel(parserModel: HomeBusinessModel.self, serverModel: serverModel) else { return }

			self.presenter?.didGetHomeInfo(businessModel: businessModel)
			
		}, failure: { (error) in
			
			error.backendError.type = .homeFailure
			self.presenter?.didNotGetHomeInfo()
			self.presenter?.genericErrorHappened(error: error)
			
		})
		
	}
}
