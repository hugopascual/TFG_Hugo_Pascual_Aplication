//
//  Utils.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 05/12/2020.
//

import Foundation
import UIKit

class Utils {
	
	static func getXib(_ xibFile: NibName) -> String {
		return xibFile.rawValue
	}
	static func getLanguageHeader() -> [String: String] {
		return [Constants.languageHeader: "ES"]
	}
	
	static func getProductCategory(_ text: String) -> ProductCategory {
		if text == ProductCategory.motherboard.rawValue {
			return ProductCategory.motherboard
		} else if text == ProductCategory.cpu.rawValue {
			return ProductCategory.cpu
		} else if text == ProductCategory.gpu.rawValue {
			return ProductCategory.gpu
		} else if text == ProductCategory.ram.rawValue {
			return ProductCategory.ram
		} else {
			return ProductCategory.other
		}
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
	
	static func imgBase64Encoding(_ image: String?) -> String {
		guard let imageToCode = image else { return "" }
		let imageData = UIImage(named: imageToCode)?.jpegData(compressionQuality: 1)
		return imageData?.base64EncodedString() ?? ""
	}
	
	static func imgBase64Encoding(_ image: UIImage) -> String {
		let imageData = image.jpegData(compressionQuality: 1)
		return imageData?.base64EncodedString() ?? ""
	}
	
	static func imgBase64Decode(_ codedImage: String?) -> UIImage {
		guard let imageToDecode = codedImage else { return UIImage() }
		guard let newImageData = Data(base64Encoded: imageToDecode) else { return UIImage() }
		return UIImage(data: newImageData) ?? UIImage()
	}
	
	static func localiceCurrency(value: Double) -> String {
		let price = value as NSNumber
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencyCode = "EUR"
		formatter.locale = Locale.current
		return formatter.string(from: price) ?? ""
	}
}
