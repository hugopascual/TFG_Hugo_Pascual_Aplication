//
//  CustomFont.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 04/01/2021.
//

import Foundation
import UIKit

struct CustomFont {
	
	var fontType: FontType
	var size: Size
	var style: Style
	
	init(fontType: FontType = .system, size: Size = .medium, style: Style = .regular) {
		
		self.fontType = fontType
		self.size = size
		self.style = style
	}
}

extension CustomFont {
	
	enum FontType {
		case system
		case chalkboardSE
	}
	
	enum Size: CGFloat {
		case XXS = 8
		case XS = 10
		case small = 12
		case medium = 14
		case large = 16
		case extraLarge = 18
		case XL = 20
		case XXL = 24
		case XXXL = 30
	}
	
	enum Style {
		case regular
		case bold
		case light
	}
}

extension CustomFont {
	
		var uiFont: UIFont {
			
			var name = ""
			
			switch self.fontType {
			case .system:
				return UIFont.systemFont(ofSize: self.size.rawValue)
				
			case .chalkboardSE:
				switch self.style {
				case .regular:
					name = "Chalkboard SE Regular"
				case .bold:
					name = "Chalkboard SE Bold"
				case .light:
					name = "Chalkboard SE Light"
				}
				
				return UIFont(name: name, size: self.size.rawValue) ?? UIFont.systemFont(ofSize: self.size.rawValue)
				
			}
			
		}
}
