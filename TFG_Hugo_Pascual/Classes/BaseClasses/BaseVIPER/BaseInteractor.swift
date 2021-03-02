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
	
	required override init() {}
	
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

// MARK: Login and Logout
extension BaseInteractor {

	func removeDataForLogout() {

//		DataPersisterHelper.standard.removeAllKeyChainLoginData()
	}

	func closeSessionRemindingUser() {

//		let localUserData =  DataPersisterHelper.standard.localUserData
//		localUserData.loginToken = ""
//		DataPersisterHelper.standard.localUserData = localUserData
	}

	// MARK: Login
	func checkSessionExpiredError(error: CustomErrorModel,
								  provider: BaseProviderProtocol?,
								  tabBarFunctionality: Bool,
								  loginSuccess: @escaping (() -> Void),
								  loginFailure: (() -> Void)? = nil) -> Bool {

//		guard error.backendError.type == .invalidToken else { return false }
//
//		let username = DataPersisterHelper.standard.localUserData.username
//		let password = DataPersisterHelper.standard.localUserData.password
//
//		guard !username.isEmpty, !password.isEmpty else {
//				self.basePresenter?.autologinErrorHappened(loginSuccess: loginSuccess, tabBarFunctionality: tabBarFunctionality)
//				return true
//		}

//		let paramsDTO = LoginDTO(username: username, password: password)
//		let providerDTO = LoginProviderRequest.getLoginConstants(params: paramsDTO)
//		provider?.genericRequest(
//			dto: providerDTO,
//			success: { serverModel in
//
//				guard let serverModel = serverModel as? LoginServerModel,
//					let businessModel = BaseInteractor.parseToBusinessModel(parserModel: LoginBusinessModel.self, serverModel: serverModel),
//					let userToken = businessModel.userToken else { return }
//
//				self.saveUserData(username: username, password: password, token: userToken, nickname: businessModel.nickname, oid: businessModel.oid)
//
//				loginSuccess()
//		},
//			failure: { _ in
//
//				guard let loginFailure = loginFailure else {
//
//					self.basePresenter?.autologinErrorHappened(loginSuccess: loginSuccess, tabBarFunctionality: tabBarFunctionality)
//					return
//				}
//
//				loginFailure()
//		})
		return true
	}

//	func getUserLoginState() -> UserLoginState {
//		if !DataPersisterHelper.standard.localUserData.loginToken.isEmpty {
//			return .logged
//		} else if DataPersisterHelper.standard.localUserData.isReminded {
//			return .reminded
//		} else {
//			return .noLogged
//		}
//	}

//	func getUserToken() -> String {
//		return DataPersisterHelper.standard.localUserData.loginToken
//	}

	func saveUserData(email: String? = nil,
					  username: String? = nil,
					  token: String? = nil,
					  id: String? = nil) {

//		let localUserData = DataPersisterHelper.standard.localUserData
//		if let email = email {
//			localUserData.email = email
//		}
//		if let username = username {
//			localUserData.username = username
//		}
//		if let token = token {
//			localUserData.token = token
//		}
//		if let id = id {
//			localUserData.id = id
//		}
//		DataPersisterHelper.standard.localUserData = localUserData
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
