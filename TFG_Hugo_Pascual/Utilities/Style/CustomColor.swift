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
	case textHighlighted
	case textPlaceholder
	
	// MARK: View Colors
	case viewGeneralBackground
	case viewPrimary
	case viewSecondary
	case viewInfoToast
	case viewSucessToast
	case viewFailureToast
}

extension CustomColor {
	var uiColor: UIColor {
		return UIColor(named: self.rawValue) ?? UIColor.clear
	}
}
