//
//  String+Extension.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 11/05/2021.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
	}
}
