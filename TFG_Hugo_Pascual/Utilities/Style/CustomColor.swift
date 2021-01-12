//
//  CustomColor.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/01/2021.
//

import Foundation
import UIKit

enum CustomColor: String {

	case textNormal
	
	case viewBackground
	case viewHighlight
}

extension CustomColor {
	var uiColor: UIColor {
	   
		var color: UIColor
		
		switch self {
		case .textNormal:
			color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
			
		case .viewBackground:
			color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		case .viewHighlight:
			color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
		}
		
		return UIColor(named: self.rawValue.capitalized) ?? color
	}
}
