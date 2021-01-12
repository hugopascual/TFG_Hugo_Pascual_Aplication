//
//  BaseInteractor.swift
//  App_Compraventa_TFG
//
//  Created by Hugo Pascual Adan on 29/11/2020.
//

import MapKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseInteractor: NSObject, BaseProviderDelegate {
 
	// Declared weak for the ARC to destroy them.
	weak var basePresenter: BaseInteractorOutputProtocol?
	
	required override init() {
		
	}
	
	// MARK: BaseProviderDelegate
	func requestDone(endpoint: String) {
		self.basePresenter?.asyncTaskStarted()
	}
	
	func responseGet(endpoint: String) {
		self.basePresenter?.asyncTaskFinished()
	}
	
	func networkNotReachable(endpoint: String) {
		self.basePresenter?.networkErrorHappened()
	}

}

// MARK: Parser
extension BaseInteractor {
	
	static func parseToBusinessModel<Model: BaseBusinessModel, ServerModel: BaseServerModel>(parserModel: Model.Type, serverModel: ServerModel?) -> Model? {
		
		guard let serverModel = serverModel else { return nil }
		
		return Model(serverModel: serverModel)
	}
	
	static func parseArrayToBusinessModel<Model: BaseBusinessModel, ServerModel: BaseServerModel>(parserModel: [Model].Type, arrayServerModels: [ServerModel]?) -> [Model]? {
		
		guard let arrayServerModels = arrayServerModels else { return nil }
		
		return arrayServerModels.map({ serverModel -> Model in
			Model(serverModel: serverModel)
		})
	}
}
