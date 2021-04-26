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

extension UIView {
	
	func roundedByDefault(radious: CGFloat? = nil,
						  background: UIColor? = nil,
						  borderWith: CGFloat = 0,
						  borderColor: UIColor? = nil) {
		
		let radious = radious == nil ? self.frame.height / 2 : radious!
		self.layer.cornerRadius = radious
		
		if let background = background {
			self.backgroundColor = background
		}
		self.layer.borderWidth = borderWith
		self.layer.borderColor = borderColor?.cgColor
		
		self.clipsToBounds = true
	}
}
