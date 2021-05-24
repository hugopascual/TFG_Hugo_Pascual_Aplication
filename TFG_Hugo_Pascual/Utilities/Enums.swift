//
//  Enums.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation
import UIKit

enum UserLoginState {
	case logged
	case noLogged
}

enum ProductCategory: String {
	case motherboard = "MOTHERBOARD"
	case cpu = "CPU"
	case gpu = "GPU"
	case ram = "RAM"
	case other = "OTHER"
	
	func getLocalizedString() -> String {
		switch self {
		case .motherboard:
			return LocalizedKeys.ProductsHome.motherboard_title
		case .cpu:
			return LocalizedKeys.ProductsHome.cpu_title
		case .gpu:
			return LocalizedKeys.ProductsHome.gpu_title
		case .ram:
			return LocalizedKeys.ProductsHome.ram_title
		case .other:
			return LocalizedKeys.Common.other
		}
	}
	
	func getAssociatedImage() -> UIImage {
		switch self {
		case .motherboard:
			return UIImage(named: ImagesNamesConstants.motherboard_icon) ?? UIImage()
		case .cpu:
			return UIImage(named: ImagesNamesConstants.cpu_icon) ?? UIImage()
		case .gpu:
			return UIImage(named: ImagesNamesConstants.gpu_icon) ?? UIImage()
		case .ram:
			return UIImage(named: ImagesNamesConstants.ram_icon) ?? UIImage()
		case .other:
			return UIImage(named: ImagesNamesConstants.no_category_icon) ?? UIImage()
		}
	}
}

enum ProductStatus: String {
	case onSale = "ONSALE"
	case sold = "SOLD"
}
