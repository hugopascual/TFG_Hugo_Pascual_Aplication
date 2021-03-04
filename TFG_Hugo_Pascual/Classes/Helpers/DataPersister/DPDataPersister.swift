//
//  DPDataPersister.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/03/2021.
//

import Foundation

public enum DataPersistType {
	case userDefault
	case keyChain
}

public struct DataPersisterKey {
	
	let rawValue: String
	let type: DataPersistType
	
	public init (rawValue: String, type: DataPersistType) {
		
		self.rawValue = rawValue
		self.type = type
	}
	
	static let dataPersisterKeyExample  = DataPersisterKey(rawValue: "dataPersisterKeyExample", type: .userDefault)
}

public class DPDataPersister {
	
	public init(keyChainServiceName: String) {
		DPKeyChain.keyChainName = keyChainServiceName
	}
	
	// MARK: Save Data
	public func set(_ value: String, forKey defaultKey: DataPersisterKey) {
		switch defaultKey.type {
		case .keyChain:
			return DPKeyChain.standard.set(value, forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.set(value, forKey: defaultKey)
		}
	}
	
	public func set(_ value: Int, forKey defaultKey: DataPersisterKey) {
		switch defaultKey.type {
		case .keyChain:
			return DPKeyChain.standard.set(value, forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.set(value, forKey: defaultKey)
		}
	}
	
	public func set(_ value: Bool, forKey defaultKey: DataPersisterKey) {
		switch defaultKey.type {
		case .keyChain:
			var value = value
//            let data = NSData(bytes: &value, length: MemoryLayout<Bool>.size) as? Data
			let finalData = Data(bytes: &value, count: MemoryLayout<Bool>.size)
			return DPKeyChain.standard.set(finalData, forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.set(value, forKey: defaultKey)
		}
	}
	
	public func set(_ value: Data, forKey defaultKey: DataPersisterKey) {
		  switch defaultKey.type {
		  case .keyChain:
			  return DPKeyChain.standard.set(value, forKey: defaultKey)
		  case .userDefault:
			  return DPUserDefault.set(value, forKey: defaultKey)
		  }
	  }
		
	// MARK: Load Data
	public func getString(forKey defaultKey: DataPersisterKey) -> String? {

		switch defaultKey.type {
		case .keyChain:
			return DPKeyChain.standard.getString(forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.getString(forKey: defaultKey)
		}
	}
	
	public func getInt(forKey defaultKey: DataPersisterKey) -> Int? {
		switch defaultKey.type {
		case .keyChain:
			return DPKeyChain.standard.getInt(forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.getInt(forKey: defaultKey)
		}
	}
	
	public func getBool(forKey defaultKey: DataPersisterKey) -> Bool? {
		   switch defaultKey.type {
		   case .keyChain:
			let data = DPKeyChain.standard.getData(forKey: defaultKey)
			guard let finalData = data else { return false }
			   return String(data: finalData, encoding: .utf8).flatMap(Bool.init)
		   case .userDefault:
			   return DPUserDefault.getBool(forKey: defaultKey)
		   }
	   }
	
	public func getData(forKey defaultKey: DataPersisterKey) -> Data? {
		switch defaultKey.type {
		case .keyChain:
			return DPKeyChain.standard.getData(forKey: defaultKey)
		case .userDefault:
			return DPUserDefault.getObject(forKey: defaultKey) as? Data
		}
	}
	
	// MARK: Remove Data
	public func removeInfo(arrayKeys: [DataPersisterKey]) {
	
		for key in arrayKeys {
			switch key.type {
			case .keyChain:
				DPKeyChain.standard.removeObject(forKey: key)
			case .userDefault:
				DPUserDefault.removeObject(forKey: key)
			}
		}
	}
}
