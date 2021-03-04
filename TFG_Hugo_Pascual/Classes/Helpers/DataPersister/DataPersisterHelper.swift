//
//  DataPersisterHelper.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/03/2021.
//

import Foundation

extension DataPersisterKey {
	static let localUserData = DataPersisterKey(rawValue: "localUserData", type: .keyChain)
}

class DataPersisterHelper {
	
	static private let standardDataPersister = DPDataPersister(keyChainServiceName: "TFG_Hugo_Pascual")
	static var standard = DataPersisterHelper()

	var localUserData: UserLocalPersistedDataBusinessModel {
		get {
			guard let userDataData = DataPersisterHelper.standardDataPersister.getData(forKey: .localUserData) else { return UserLocalPersistedDataBusinessModel() }
			var userData: UserLocalPersistedDataBusinessModel?
			do {
				userData = try JSONDecoder().decode(UserLocalPersistedDataBusinessModel.self, from: userDataData)
			} catch {
				return UserLocalPersistedDataBusinessModel()
			}
			
			return userData ?? UserLocalPersistedDataBusinessModel()
		}
		set(newUser) {
			do {
				let userData = try JSONEncoder().encode(newUser)
				DataPersisterHelper.standardDataPersister.set(userData, forKey: .localUserData)
			} catch {
				return
			}
		}
	}
	
	func removeAllKeyChainData() {
		DataPersisterHelper.standardDataPersister.removeInfo(arrayKeys: [.localUserData])
	}
	
	func removeAllKeyChainLoginData() {
		DataPersisterHelper.standardDataPersister.removeInfo(arrayKeys: [.localUserData])
	}
}
