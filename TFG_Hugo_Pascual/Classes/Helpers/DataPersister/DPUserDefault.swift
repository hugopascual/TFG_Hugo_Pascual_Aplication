//
//  DPUserDefault.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/03/2021.
//

import Foundation

public class DPUserDefault {
	
	// MARK: Save Data
	public static func set(_ value: Any, forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.set(value, forKey: defaultKey.rawValue)
	}
	
	public static func set(_ value: Int, forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.set(value, forKey: defaultKey.rawValue)
	}
	
	public static func set(_ value: Bool, forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.set(value, forKey: defaultKey.rawValue)
	}
	
	public static func set(_ value: Float, forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.set(value, forKey: defaultKey.rawValue)
	}
	
	public static func set(_ value: Double, forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.set(value, forKey: defaultKey.rawValue)
	}
	
	// MARK: Load Data
	public static func getObject(forKey defaultKey: DataPersisterKey) -> Any? {
		return UserDefaults.standard.object(forKey: defaultKey.rawValue)
	}
	
	public static func getString(forKey defaultKey: DataPersisterKey) -> String? {
		return UserDefaults.standard.string(forKey: defaultKey.rawValue)
	}
	
	public static func getInt(forKey defaultKey: DataPersisterKey) -> Int? {
		return UserDefaults.standard.integer(forKey: defaultKey.rawValue)
	}
	
	public static func getBool(forKey defaultKey: DataPersisterKey) -> Bool? {
		return UserDefaults.standard.bool(forKey: defaultKey.rawValue)
	}
	
	public static func getFloat(forKey defaultKey: DataPersisterKey) -> Float? {
		return UserDefaults.standard.float(forKey: defaultKey.rawValue)
	}
	
	public static func getDouble(forKey defaultKey: DataPersisterKey) -> Double? {
		return UserDefaults.standard.double(forKey: defaultKey.rawValue)
	}
	
	// MARK: Remove Data
	public static func removeObject(forKey defaultKey: DataPersisterKey) {
		UserDefaults.standard.removeObject(forKey: defaultKey.rawValue)
	}
}
