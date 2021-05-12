//  
//  ProductChooseCategoryViewModel.swift
//  TFG_Hugo_Pascual
//
//  Created by Hugo Pascual Adan on 27/04/2021.
//

import Foundation

final class ProductChooseCategoryViewModel: BaseViewModel {

	//TODO añadir localización
	var screenTitle: String = LocalizedKeys.ProductChooseCategory.choose_category
	
	var addProductButtonTitle: String = LocalizedKeys.ProductsHome.add_product_button_title
	var categoryCells: [ProductsHomeCategoryCellViewModel] = []
	
	override init() {
		super.init()
		
		self.categoryCells.append(.motherboard)
		self.categoryCells.append(.cpu)
		self.categoryCells.append(.gpu)
		self.categoryCells.append(.ram)
	}
	
	required init(businessModel: BaseBusinessModel?) {
		super.init()
	}
}
