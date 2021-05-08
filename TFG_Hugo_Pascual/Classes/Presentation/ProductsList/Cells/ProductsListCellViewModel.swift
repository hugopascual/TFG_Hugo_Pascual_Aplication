//
//  ProductsListCellViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/05/2021.
//

import Foundation

class ProductsListCellViewModel {

	var id: Int?
	var image: String?
	var model: String?
	var price: String?
	
	init(id: Int? = 0, image: String? = nil, title: String? = nil, price: String? = nil) {
		self.id = id
		self.image = image
		self.model = title
		self.price = price
	}
}
