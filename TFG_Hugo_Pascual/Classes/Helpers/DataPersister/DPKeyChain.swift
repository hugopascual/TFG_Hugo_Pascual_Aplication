//
//  DPKeyChain.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/03/2021.
//

import Foundation
import KeychainAccess

public class DPKeyChain {
 
	static var keyChainName = ""
	public static var standard = DPKeyChain()
	fileprivate var standardKeyChain = Keychain(service: DPKeyChain.keyChainName)

	// MARK: Save Data
	public func set(_ value: String, forKey defaultKey: DataPersisterKey) {
		do {
			try DPKeyChain.standard.standardKeyChain.set(value, key: defaultKey.rawValue)
		} catch let error {
			print("error: \(error)")
		}
	}
	
	public func set(_ value: Int, forKey defaultKey: DataPersisterKey) {
		let string = "\(value)"
		self.set(string, forKey: defaultKey)
	}
	
	public func set(_ value: Data, forKey defaultKey: DataPersisterKey) {
		do {
			try DPKeyChain.standard.standardKeyChain.set(value, key: defaultKey.rawValue)
		} catch let error {
			print("error: \(error)")
		}
	}
	
	// MARK: Load Data
	public func getString(forKey defaultKey: DataPersisterKey) -> String? {
		do {
			return try DPKeyChain.standard.standardKeyChain.getString(defaultKey.rawValue)
		} catch let error {
			print("error: \(error)")
			return nil
		}
	}
	
	public func getInt(forKey defaultKey: DataPersisterKey) -> Int? {
		guard let string = self.getString(forKey: defaultKey) else { return nil }
		return Int(string)
	}
	
	public func getData(forKey defaultKey: DataPersisterKey) -> Data? {
		do {
			return try DPKeyChain.standard.standardKeyChain.getData(defaultKey.rawValue)
		} catch let error {
			print("error: \(error)")
			return nil
		}
	}
	
	// MARK: Delete Data
	public func removeObject(forKey defaultKey: DataPersisterKey) {
		do {
			try DPKeyChain.standard.standardKeyChain.remove(defaultKey.rawValue)
		} catch let error {
			print("error: \(error)")
		}
	}
}
