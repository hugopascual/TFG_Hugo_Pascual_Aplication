//
//  ProductsHomeCategoryCellViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 08/05/2021.
//

import Foundation

class ProductsHomeCategoryCellViewModel {

	var category: ProductCategory?
	var image: String?
	var title: String?
	var description: String?
	
	init(category: ProductCategory? = nil, image: String? = nil, title: String? = nil, description: String? = nil) {
		self.category = category
		self.image = image
		self.title = title
		self.description = description
	}
}

extension ProductsHomeCategoryCellViewModel {
	static let motherboard = ProductsHomeCategoryCellViewModel(category: .motherboard, image: ImagesNamesConstants.motherboard_icon, title: LocalizedKeys.ProductsHome.motherboard_title, description: LocalizedKeys.ProductsHome.motherboard_description)
	static let cpu = ProductsHomeCategoryCellViewModel(category: .cpu, image: ImagesNamesConstants.cpu_icon, title: LocalizedKeys.ProductsHome.cpu_title, description: LocalizedKeys.ProductsHome.cpu_description)
	static let gpu = ProductsHomeCategoryCellViewModel(category: .gpu, image: ImagesNamesConstants.gpu_icon, title: LocalizedKeys.ProductsHome.gpu_title, description: LocalizedKeys.ProductsHome.gpu_description)
	static let ram = ProductsHomeCategoryCellViewModel(category: .ram, image: ImagesNamesConstants.ram_icon, title: LocalizedKeys.ProductsHome.ram_title, description: LocalizedKeys.ProductsHome.ram_description)
}
