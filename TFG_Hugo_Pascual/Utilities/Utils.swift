//
//  Utils.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation

class Utils {
	
	static func getXib(_ xibFile: XibFile) -> String {
		return xibFile.rawValue
	}
	static func getLanguageHeader() -> [String: String] {
		return [Constants.languageHeader: "ES"]
	}

	static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
		
		#if DEBUG
		
		var idx = items.startIndex
		let endIdx = items.endIndex
		
		repeat {
			Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
			idx += 1
		}
			while idx < endIdx
		
		#endif
	}
	
}
