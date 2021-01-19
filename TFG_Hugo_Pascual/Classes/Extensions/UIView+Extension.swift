//
//  UIView+Extension.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 18/01/2021.
//

import Foundation
import UIKit

extension UIView {
	
	func applyShadowWithCorner(cornerRadius: CGFloat, opacity: Float, blur: CGFloat) {
		self.clipsToBounds = false
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOpacity = opacity
		self.layer.shadowOffset = CGSize.zero
		self.layer.shadowRadius = blur
		self.layer.cornerRadius = cornerRadius
		self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
	}
	
}
