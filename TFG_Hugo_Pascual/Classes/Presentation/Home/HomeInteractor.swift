//
//  HomeInteractor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
//	func getHome()
}

class HomeInteractor: BaseInteractor {

	// MARK: VIPER Dependencies
	weak var presenter: HomeInteractorOutputProtocol? { return super.basePresenter as? HomeInteractorOutputProtocol }
	
	var assemblyDTO: HomeAssemblyDTO?
	
	// MARK: Private Functions
	
}

// MARK: Extensions declaration of all extension and implementations of protocols
extension HomeInteractor: HomeInteractorInputProtocol {
	
//	func getHome() {
//
//		let dto = HomeDTO()
//
//		self.homeProvider?.getHome(dto: dto, additionalHeaders: [:], success: { (serverModel) in
//
//			guard let businessModel = BaseInteractor.parseToBusinessModel(parserModel: HomeBusinessModel.self, serverModel: serverModel) else { return }
//
//			self.presenter?.didGetHomeInfo(businessModel: businessModel)
//
//		}, failure: { (error) in
//
//			error.backendError.type = .unknownError
//			self.presenter?.didNotGetHomeInfo()
//			self.presenter?.genericErrorHappened(error: error)
//
//		})
//
//	}
}
