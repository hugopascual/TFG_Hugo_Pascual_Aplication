//
//  CustomColor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 19/01/2021.
//

import Foundation
import UIKit

enum CustomColor: String {
	
	// MARK: Text Colors
	case textNormal
	
	// MARK: View Colors
	case viewGeneralBackground
	case viewPrimary
}

extension CustomColor {
	var uiColor: UIColor {
		
		var color: String
		switch self {
		case .textNormal:
			color = self.rawValue
		case .viewGeneralBackground:
			color = self.rawValue
		case .viewPrimary:
			color = self.rawValue
		}
		return UIColor(named: color)!
	}
}
