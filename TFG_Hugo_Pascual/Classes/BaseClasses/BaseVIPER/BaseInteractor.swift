//
//  BaseInteractor.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import Foundation

class BaseInteractor {
	
	internal weak var basePresenter: BaseInteractorOutputProtocol?
	
	required init() {}
	
	static func parseToBusinessModel<BusinessModel: BaseBusinessModel, ServerModel: BaseServerModel>(parserModel: BusinessModel.Type, serverModel: ServerModel?) -> BusinessModel? {
		
		guard let serverModel = serverModel else { return nil }
		
		return BusinessModel(serverModel: serverModel)
	}
	
}
